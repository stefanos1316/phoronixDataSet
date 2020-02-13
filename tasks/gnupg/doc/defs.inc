@c defs.inc                         -*- texinfo -*-
@c Common and build specific constants for the manuals.
@c This file has been created by mkdefsinc.

@ifclear defsincincluded
@set defsincincluded 1


@c Flags


@c Directories

@set BINDIR         /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/bin
@set LIBEXECDIR     /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/libexec
@set LIBDIR         /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/lib/gnupg
@set DATADIR        /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/share/gnupg
@set SYSCONFDIR     /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/etc/gnupg
@set LOCALSTATEDIR  /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/var
@set LOCALCACHEDIR  /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/var/cache/gnupg
@set LOCALRUNDIR    /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/var/run/gnupg
@set SYSCONFSKELDIR /home/sgeorgiou/GitHub/phoronixDataSet/tasks/gnupg/etc/skel/.gnupg

@c Version information a la version.texi

@set UPDATED 23 November 2019
@set UPDATED-MONTH November 2019
@set EDITION 2.2.19
@set VERSION 2.2.19

@c Algorithm defaults

@set GPGSYMENCALGO AES-128

@c Macros

@macro gpgname
gpg
@end macro
@macro gpgvname
gpgv
@end macro

@end ifclear

@c Local Variables:
@c buffer-read-only: t
@c End:
