# mlops-spark

Run your Spark cluster as a collection of Neuro jobs


## Quick Start

Sign up at [neu.ro](https://neu.ro) and setup your local machine according to [instructions](https://docs.neu.ro/).

Then run:

```shell
pip install -U pipx
pipx install neuro-all
neuro login
neuro-flow build main
neuro-flow run master
neuro-flow run worker
neuro-flow run workload
```

See [Help.md](HELP.md) for the detailed Neuro Project Template Reference.
