# Cloud Foundry App

## Push to IBM CloudFoundry

In `IBM Cloud Shell`, run commands:

```
git clone https://github.com/silentred/ibmcloud-go.git
cd ibmcloud-go
ibmcloud login
ibmcloud target --cf
ibmcloud cf push
```

When the new app is `Running`, you can visit this app at the following URLs:
```
curl http://$CloudFountryGeneratedDomain/
Hello World!

curl http://$CloudFountryGeneratedDomain/static/test.txt
test file
```

## Buildpacks Doc

- [golang](https://docs.cloudfoundry.org/buildpacks/go/index.html)
- [binary](https://docs.cloudfoundry.org/buildpacks/binary/index.html)
