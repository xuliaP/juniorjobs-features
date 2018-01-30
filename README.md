# juniorjobs-features
Cucumber/Watir tests for [JuniorJobs](https://github.com/howtohireme/juniorjobs.ru)
## Install
clone juniorjobs app
clone juniorjobs-features

## Run features:
- run juniorjobs app
- Move to the directory with the juniorjobs-features app

- run all features:
'''shell
cucumber
'''
- run all scenario on feature:
'''shell
cucumber features/path_to_feature
'''
- run scenario:
'''shell
cucumber features/path_to_feature:string_number
'''