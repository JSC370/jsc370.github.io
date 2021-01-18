## Simulation 1

set.seed(123654)

x <- rbinom(500, 1, 0.5)
rx <- sapply(x, function(x) if (x==0) rbinom(1,1,0.8) else rbinom(1,1,0.2))
eps <- rnorm(500,0,15)
y <- 50 - 10*x + eps
rx1 <- rbinom(500, 1, 0.5) # RCT


table(rx)


## Observational analysis
# Unadjusted
summary(lm(y~rx))
confint(lm(y~rx))

# Adjusted
summary(lm(y~rx+x))
confint(lm(y~rx+x))

xtabs(~x+rx)

## RCT Analysis
# Unadjusted
summary(lm(y~rx1))
confint(lm(y~rx1))

# Adjusted
summary(lm(y~rx1+x))
confint(lm(y~rx1+x))

## Simulation 2

y1 <- 50 + 5*rx - 10*x + eps # Observational
y2 <- 50 + 5*rx1 - 10*x + eps # RCT

## Observational analysis
# Unadjusted
summary(lm(y1~rx))
confint(lm(y1~rx))

# Adjusted
summary(lm(y1~rx+x))
confint(lm(y1~rx+x))


## RCT analysis
# Unadjusted
summary(lm(y2~rx1))
confint(lm(y2~rx1))

# Adjusted
summary(lm(y2~rx1+x))
confint(lm(y2~rx1+x))

## Simulation 3

y3 <- 50 - 5*rx - 10*x + eps # Observational
y4 <- 50 - 5*rx1 - 10*x + eps # RCT


## Observational analysis
# Unadjusted
summary(lm(y3~rx))
confint(lm(y3~rx))

# Adjusted
summary(lm(y3~rx+x))
confint(lm(y3~rx+x))

## RCT analysis
# Unadjusted
summary(lm(y4~rx1))
confint(lm(y4~rx1))

# Adjusted
summary(lm(y4~rx1+x))
confint(lm(y4~rx1+x))
