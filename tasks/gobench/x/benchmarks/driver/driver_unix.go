// Copyright 2013 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build darwin dragonfly freebsd linux netbsd openbsd

package driver

import (
	"bytes"
	"log"
	"os/exec"
	"syscall"
	"time"
)

type sysStats struct {
	N      uint64
	Rusage syscall.Rusage
}

func InitSysStats(N uint64) sysStats {
	ss := sysStats{N: N}
	if err := syscall.Getrusage(0, &ss.Rusage); err != nil {
		log.Printf("Getrusage failed: %v", err)
		ss.N = 0
		// Deliberately ignore the error.
	}
	return ss
}

func (ss sysStats) Collect(res *Result) {
	if ss.N == 0 {
		return
	}
	if vm := getVMPeak(); vm != 0 {
		res.Metrics["peak-VM-bytes"] = vm
	}
	usage := new(syscall.Rusage)
	if err := syscall.Getrusage(0, usage); err != nil {
		log.Printf("Getrusage failed: %v", err)
		// Deliberately ignore the error.
		return
	}
	res.Metrics["peak-RSS-bytes"] = uint64(usage.Maxrss) * rssMultiplier
	res.Metrics["user+sys-ns/op"] = (cpuTime(usage) - cpuTime(&ss.Rusage)) / ss.N
}

func RunAndCollectSysStats(cmd *exec.Cmd, res *Result, N uint64, prefix string) (string, error) {
	var out bytes.Buffer
	cmd.Stdout = &out
	cmd.Stderr = &out
	t0 := time.Now()
	if err := cmd.Run(); err != nil {
		return out.String(), err
	}
	t1 := time.Now()
	usage := cmd.ProcessState.SysUsage().(*syscall.Rusage)
	res.RunTime = uint64(t1.Sub(t0)) / N
	res.Metrics[prefix+"ns/op"] = res.RunTime
	res.Metrics[prefix+"user+sys-ns/op"] = cpuTime(usage) / N
	res.Metrics[prefix+"peak-RSS-bytes"] = uint64(usage.Maxrss) * rssMultiplier
	return out.String(), nil
}

func cpuTime(usage *syscall.Rusage) uint64 {
	return uint64(usage.Utime.Sec)*1e9 + uint64(usage.Utime.Usec*1e3) +
		uint64(usage.Stime.Sec)*1e9 + uint64(usage.Stime.Usec)*1e3
}
