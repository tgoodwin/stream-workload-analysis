#!/usr/bin/env python3

import os
import subprocess
import argparse


ESESC_BIN = "../main/esesc"


def run_benchmark(name, cmd, params):
    """
    runs a benchmark `name` and and sweeps a given param across a range of values
    """

    # set up a baseline
    base_env = dict(
        os.environ,
        **{
            "ESESC_ReportFile": f"{name}_baseline",
            "ESESC_BenchName": cmd,
            # "OMP_NUM_THREADS": "10",
        },
    )

    # print("running baseline")
    # subprocess.check_call([ESESC_BIN], env=base_env)
    exp_params = {f"ESESC_{param}": val for param, val in params.items()}
    exp_params.update({"ESESC_ReportFile": f"{name}"})

    # for param, val in params:
    #     exp_params = {
    #         "ESESC_ReportFile": f"{name}_{param}_{val}",
    #         f"ESESC_{param}": val
    #     }
    print(f"running expiriment for {name} with params: {str(exp_params)}")
    subprocess.check_call([ESESC_BIN], env=dict(base_env, **exp_params))


class KwargParser(argparse.Action):
    def __call__(self, parser, namespace, values, option_string=None):
        setattr(namespace, self.dest, dict())
        for value in values:
            k, v = value.split("=")
            getattr(namespace, self.dest)[k] = v


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "--name")
    parser.add_argument("-k", "--kwargs", nargs="*", action=KwargParser)
    args = parser.parse_args()
    run_benchmark(args.name, "/home/cse220/STREAM/stream_80M.rv", args.kwargs)
