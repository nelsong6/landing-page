# landing-page

Static landing page for [romaine.life](https://romaine.life).

Served from AKS (namespace `landing-page`) via a minimal Node+Express container behind the shared Envoy Gateway. Image built and pushed to `romainecr.azurecr.io/landing-page` by `.github/workflows/build-and-deploy.yaml`; Argo CD picks up the kustomization tag bump on `main` and rolls the deployment.
