# python plot_results.py ../results/scaling_single.txt 1 "MPI Process Count" 5 "Runtime (s)" 1.0 "sphNG: Single Node Performance" "../plots/sphng-snp-runtime" 1.0 "upper right" 0
# python plot_results.py ../results/scaling_single.txt 1 "MPI Process Count" 6 "Simulation Years per sec" 1.4874e+13 "sphNG: Single Node Performance" "../plots/sphng-snp-simtime" 1.0 "lower right" 0

# python plot_results.py ../results/scaling_strong.txt 0 "Nodes" 5 "Runtime (s)" 1.0 "sphNG: Strong Scaling Performance" "../plots/sphng-ssp-runtime" 1.0 "best" 0
python plot_results.py ../results/scaling_strong.txt 0 "Nodes" 6 "Simulated years/s" 1.4874e+13 "sphNG: Strong Scaling Performance" "../plots/sphng-ssp-simtime" 1.0 "best" 0

# python plot_results.py ../results/scaling_weak.txt 0 "Nodes" 5 "Runtime (s)" 1.0 "sphNG: Weak Scaling Performance" "../plots/sphng-wsp-runtime" 1.0 "best" 0
# python plot_results.py ../results/scaling_weak.txt 0 "Nodes" 6 "Simulated years/s" 1.4874e+13 "sphNG: Weak Scaling Performance" "../plots/sphng-wsp-simtime" 1.0 "best" 0
