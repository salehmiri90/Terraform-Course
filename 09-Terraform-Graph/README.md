# Terraform Graph

## Step-01: Introduction
- The `terraform graph` command is used to generate a visual representation of either a configuration or execution plan
- The output is in the DOT format, which can be used by [GraphViz](http://www.graphviz.org/) to generate charts.

## Step-02: Run Terraform Graph command
```t
# Terraform Initialize
terraform init

# Terraform Graph
terraform graph > dot1
Observation: 
This command will output DOT format text and store in file dot1
```

## Step-03: Online Graphviz Viewers
- [Graphviz-Online](https://dreampuf.github.io/GraphvizOnline/)
- [Edotor-Online](https://edotor.net/)
- Copy and paste the text from `dot1` file generated in step-02 in these online Graphviz Viewers
- Review the output

## Step-04: Clean-Up
```t
# Delete .terraform files
rm -rf .terraform*
```

## References
- [Terraform Graph](https://www.terraform.io/docs/cli/commands/graph.html)