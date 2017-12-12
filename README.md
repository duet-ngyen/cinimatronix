# Cinema using rails and webpack + vuejs

---

# Setup

```
$ bin/rails webpacker:install
$ bin/rails webpacker:install:vue
$ bin/yarn install
```

# running

```
# Procfile
backend: bin/rails s -p 3000
frontend: bin/webpack-dev-server
```
