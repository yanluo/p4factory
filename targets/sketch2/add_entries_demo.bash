python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry send_frame 1 rewrite_mac 00:aa:bb:00:00:00" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry send_frame 2 rewrite_mac 00:aa:bb:00:00:01" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry send_frame 3 rewrite_mac 00:aa:bb:00:00:02" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry send_frame 4 rewrite_mac 00:aa:bb:00:00:03" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry forward 10.0.0.10 set_dmac 00:04:00:00:00:00" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry forward 10.0.1.10 set_dmac 00:04:00:00:00:01" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry forward 10.0.2.10 set_dmac 00:04:00:00:00:02" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry forward 10.0.3.10 set_dmac 00:04:00:00:00:03" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_for_flow_number 10.0.0.10 maintain_flow_number" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_for_flow_number 10.0.1.10 maintain_flow_number" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_for_flow_number 10.0.2.10 maintain_flow_number" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_for_flow_number 10.0.3.10 maintain_flow_number" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_temp2 10.0.0.10 temp2" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_temp2 10.0.1.10 temp2" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_temp2 10.0.2.10 temp2" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_temp2 10.0.3.10 temp2" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_temp1 10.0.0.10 temp1" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_temp1 10.0.1.10 temp1" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_temp1 10.0.2.10 temp1" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry table_temp1 10.0.3.10 temp1" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val3 10.0.0.10 min_val3" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val3 10.0.1.10 min_val3" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val3 10.0.2.10 min_val3" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val3 10.0.3.10 min_val3" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val2 10.0.0.10 min_val2" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val2 10.0.1.10 min_val2" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val2 10.0.2.10 min_val2" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val2 10.0.3.10 min_val2" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val1 10.0.0.10 min_val1" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val1 10.0.1.10 min_val1" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val1 10.0.2.10 min_val1" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry minimum_val1 10.0.3.10 min_val1" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry old_table_entry_array 10.0.0.10 again_count" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry old_table_entry_array 10.0.1.10 again_count" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry old_table_entry_array 10.0.2.10 again_count" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry old_table_entry_array 10.0.3.10 again_count" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry new_table_entry_array 10.0.0.10 first_time_count" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry new_table_entry_array 10.0.1.10 first_time_count" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry new_table_entry_array 10.0.2.10 first_time_count" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry new_table_entry_array 10.0.3.10 first_time_count" -c localhost:22222

python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry ipv4_lpm 10.0.0.10 32 set_nhop 10.0.0.10 1" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry ipv4_lpm 10.0.1.10 32 set_nhop 10.0.1.10 2" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry ipv4_lpm 10.0.2.10 32 set_nhop 10.0.2.10 3" -c localhost:22222
python ../../cli/pd_cli.py -p sketch -i p4_pd_rpc.sketch -s $PWD/of-tests/pd_thrift:$PWD/../../submodules/oft-infra -m "add_entry ipv4_lpm 10.0.3.10 32 set_nhop 10.0.3.10 4" -c localhost:22222
