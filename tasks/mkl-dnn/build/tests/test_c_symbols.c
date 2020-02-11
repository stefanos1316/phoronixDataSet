#include "dnnl.h"
const void *c_functions[] = {
(void*)dnnl_batch_normalization_backward_desc_init,
(void*)dnnl_batch_normalization_forward_desc_init,
(void*)dnnl_binary_desc_init,
(void*)dnnl_concat_primitive_desc_create,
(void*)dnnl_convolution_backward_data_desc_init,
(void*)dnnl_convolution_backward_weights_desc_init,
(void*)dnnl_convolution_forward_desc_init,
(void*)dnnl_deconvolution_backward_data_desc_init,
(void*)dnnl_deconvolution_backward_weights_desc_init,
(void*)dnnl_deconvolution_forward_desc_init,
(void*)dnnl_dilated_convolution_backward_data_desc_init,
(void*)dnnl_dilated_convolution_backward_weights_desc_init,
(void*)dnnl_dilated_convolution_forward_desc_init,
(void*)dnnl_dilated_deconvolution_backward_data_desc_init,
(void*)dnnl_dilated_deconvolution_backward_weights_desc_init,
(void*)dnnl_dilated_deconvolution_forward_desc_init,
(void*)dnnl_eltwise_backward_desc_init,
(void*)dnnl_eltwise_forward_desc_init,
(void*)dnnl_engine_create,
(void*)dnnl_engine_destroy,
(void*)dnnl_engine_get_count,
(void*)dnnl_engine_get_kind,
(void*)dnnl_gemm_s8s8s32,
(void*)dnnl_gemm_u8s8s32,
(void*)dnnl_gru_backward_desc_init,
(void*)dnnl_gru_forward_desc_init,
(void*)dnnl_inner_product_backward_data_desc_init,
(void*)dnnl_inner_product_backward_weights_desc_init,
(void*)dnnl_inner_product_forward_desc_init,
(void*)dnnl_layer_normalization_backward_desc_init,
(void*)dnnl_layer_normalization_forward_desc_init,
(void*)dnnl_lbr_gru_backward_desc_init,
(void*)dnnl_lbr_gru_forward_desc_init,
(void*)dnnl_lrn_backward_desc_init,
(void*)dnnl_lrn_forward_desc_init,
(void*)dnnl_lstm_backward_desc_init,
(void*)dnnl_lstm_forward_desc_init,
(void*)dnnl_memory_create,
(void*)dnnl_memory_desc_equal,
(void*)dnnl_memory_desc_get_size,
(void*)dnnl_memory_desc_init_by_strides,
(void*)dnnl_memory_desc_init_by_tag,
(void*)dnnl_memory_desc_init_submemory,
(void*)dnnl_memory_desc_reshape,
(void*)dnnl_memory_destroy,
(void*)dnnl_memory_get_data_handle,
(void*)dnnl_memory_get_engine,
(void*)dnnl_memory_get_memory_desc,
(void*)dnnl_memory_map_data,
(void*)dnnl_memory_set_data_handle,
(void*)dnnl_memory_unmap_data,
(void*)dnnl_pooling_backward_desc_init,
(void*)dnnl_pooling_forward_desc_init,
(void*)dnnl_post_ops_append_eltwise,
(void*)dnnl_post_ops_append_sum,
(void*)dnnl_post_ops_create,
(void*)dnnl_post_ops_destroy,
(void*)dnnl_post_ops_get_kind,
(void*)dnnl_post_ops_get_params_eltwise,
(void*)dnnl_post_ops_get_params_sum,
(void*)dnnl_post_ops_len,
(void*)dnnl_primitive_attr_clone,
(void*)dnnl_primitive_attr_create,
(void*)dnnl_primitive_attr_destroy,
(void*)dnnl_primitive_attr_get_output_scales,
(void*)dnnl_primitive_attr_get_post_ops,
(void*)dnnl_primitive_attr_get_scratchpad_mode,
(void*)dnnl_primitive_attr_set_output_scales,
(void*)dnnl_primitive_attr_set_post_ops,
(void*)dnnl_primitive_attr_set_rnn_data_qparams,
(void*)dnnl_primitive_attr_set_rnn_weights_qparams,
(void*)dnnl_primitive_attr_set_scratchpad_mode,
(void*)dnnl_primitive_create,
(void*)dnnl_primitive_desc_clone,
(void*)dnnl_primitive_desc_create,
(void*)dnnl_primitive_desc_destroy,
(void*)dnnl_primitive_desc_get_attr,
(void*)dnnl_primitive_desc_iterator_create,
(void*)dnnl_primitive_desc_iterator_destroy,
(void*)dnnl_primitive_desc_iterator_fetch,
(void*)dnnl_primitive_desc_iterator_next,
(void*)dnnl_primitive_desc_query,
(void*)dnnl_primitive_desc_query_md,
(void*)dnnl_primitive_desc_query_s32,
(void*)dnnl_primitive_destroy,
(void*)dnnl_primitive_execute,
(void*)dnnl_primitive_get_primitive_desc,
(void*)dnnl_reorder_primitive_desc_create,
(void*)dnnl_set_jit_dump,
(void*)dnnl_set_verbose,
(void*)dnnl_sgemm,
(void*)dnnl_shuffle_backward_desc_init,
(void*)dnnl_shuffle_forward_desc_init,
(void*)dnnl_softmax_backward_desc_init,
(void*)dnnl_softmax_forward_desc_init,
(void*)dnnl_stream_create,
(void*)dnnl_stream_destroy,
(void*)dnnl_stream_wait,
(void*)dnnl_sum_primitive_desc_create,
(void*)dnnl_vanilla_rnn_backward_desc_init,
(void*)dnnl_vanilla_rnn_forward_desc_init,
(void*)dnnl_version,
NULL};
int main() { return 0; }