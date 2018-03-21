### Hey you CI hacker
Need some additional hackery to get your cookbook working in CI,
but don't want to add trash in actual cookbook?
Why not add cookbook specific for integration tests!


Add this in your Berksfile, to have additional hacky workarounds for CI:
```
group :integration do
  cookbook 'ci_cookbook', path: 'test/ci_cookbook'
end
```
And remember to include the ci_cookbook in your .kitchen.yml run list:
```
run_list:
  - recipe[ci_cookbook]
```