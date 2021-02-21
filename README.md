# ranjit-helmchart-testing
In this chart we are Validating Helm Chart Values 
Reference:

https://helm.sh/docs/topics/charts/#schema-files
https://www.arthurkoziel.com/validate-helm-chart-values-with-json-schemas/

Validation Point will be :

apiVersion :(required)
name : (required)
version :(required)

maintainers: # (optional)
  - name: The maintainers name (required for each maintainer)

A version must follow the SemVer 2 standard

