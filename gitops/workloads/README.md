# WordPress workloads

The `mysql` and `wordpress` Argo CD Applications deploy into the `wordpress`
namespace. Before syncing them, create a Kubernetes Secret named `mysql-pass`
in that namespace with a `password` key. Both Deployments currently read that
same key. Manage the Secret outside Git (for example, with a secret manager).

The MySQL and WordPress overlays each render a Deployment, Service, and PVC.
Both PVCs require a working default StorageClass. Back up the MySQL database
and WordPress uploads before replacing or deleting their PVCs.
