# dcc
How to run your feature tests inside Docker

# Setup and run through Docker
1. Install docker on your local machine
2. Install docker-compose on your local machine
3. Run tests
4. This is it! You do best

Chrome
```
docker-compose run --rm chrome cucumber
```

Firefox
```
docker-compose run --rm firefox cucumber
```

Edge
```
docker-compose run --rm edge cucumber
```

When you need to run specific feature (example: features/google.feature) just call:
```
docker-compose run --rm chrome cucumber features/google.feature
```

When you need to debug or see what is going on inside ('secret' can help with it):

Chrome
```
open vnc://localhost:5900
```

Edge
```
open vnc://localhost:5901
```

Firefox
```
open vnc://localhost:5902
```