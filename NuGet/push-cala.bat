dotnet nuget push *.nupkg --skip-duplicate -s gitlab_nuget
del *.nupkg
del *.snupkg