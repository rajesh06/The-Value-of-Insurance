functions {
// ... function declarations and definitions ...
}

data {
// ... declarations ...
}

transformed data {
// ... declarations ... statements ...
}

parameters {
// ... declarations ...
}

transformed parameters {
// ... declarations ... statements ...
}

model {
// ... declarations ... statements ...

// using beta priors per Krushke Sec 6.2.1
// consider a heads and b tails in a total of n = a + b flips

// mean is a / (a + b)
// mode is (a - 1) /(a + b - 2) a > 1 and b > 1

// "contentration" kappa = a + b (higher values = narrower dist) 
// (i.e. the more flips you have, the surer you are about the result)

// Alegbra:
// a = μκ and b = (1 − μ)κ (in terms of mean and concentration)
// a = ω(κ − 2) + 1 and b = (1 − ω)(κ − 2) + 1 for κ > 2 (in terms of mode and concentration)

// The value we choose for the prior κ can be thought of this way: It is the number of new flips of the coin that we would need to make us teeter between the new data and the prior belief about μ. If we would only need a few new flips to sway our beliefs, then our prior beliefs should be represented by a small κ. If we would need a large number of new flips to sway us away from our prior beliefs about μ, then our prior beliefs are worth a very large κ.

}

generated quantities {
// ... declarations ... statements ...
}
