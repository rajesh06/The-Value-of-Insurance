par(mar = c(1, 1, 1, 1))

scale <- 10

center <- 1
plot(x = 1, y = 1, type = 'n', xlim = c(0.9, 1.9),
  bty = 'n', axes = FALSE, ylim = c(0, 1.2 * scale), ylab = '', xlab = '')
rect(xleft = center - 0.1, ybottom = 0, xright = center + 0.1, ytop = scale)
#text(x = center, y = 3, label = 'Working Capital', cex = 0.7)
text(x = center, y = 1.05 * scale, label = 'Available Capital', cex = 0.7)

# Minimum working capital -----
c_m <- 0.6 * scale
text(x = center, y = c_m, label = 'Minimum Working Capital', col = 'red' , 
  pos = 3, cex = 0.7, adj = 0)
abline(h = c_m, col = 'red', lty = 'dashed')


# Plot loss RV rotate ----
center <- 1.25

dens <- 100
dens_width <- 0.2
dens_left <- center - dens_width / 2

#rate <- 9.430859 #Start at rate <- scale and iterate
d_x <- seq(from = rate, to = 0, length.out = dens)
rate <- scale - (c_m - d_x[43])

d_x <- seq(from = rate, to = 0, length.out = dens)
d_y <- dexp(1:dens / dens, rate = rate) / rate * dens_width + dens_left

points(y = d_x, x = d_y,  type = 'l', col = 'blue', lty = 'dotted')

text(x = center, y = d_x[43], label = 'ERM Threshold', col = 'blue' , 
  pos = 3, cex = 0.7, lty = 'dashed', adj = 0)
abline(h = d_x[43], col = 'blue', lty = 'dotted')

rect(xleft = dens_left, xright = dens_left + dens_width, ybottom = 0, 
  ytop = rate, border = 'blue', lty = 'dotted')

text(x = dens_left + dens_width / 2, y = rate, 
  label = 'Claim (X) Distribution', cex = 0.7, col = 'blue', pos = 3)


# reserve -----
center <- 1.50
res_left <- 1.50 - .1
rect(ybottom = d_x[43], ytop = c_m, xleft = res_left, xright = res_left + 
    dens_width, col = 'grey90', lty = 'dotted')

text(x = mean(c(res_left, res_left + dens_width)), y = mean(c(d_x[43], c_m)), 
  label = 'Reserves\n(Segregated\nCapital)', cex = 0.7)

arrow_bend_y <- mean(c(scale, scale - (c_m - d_x[43])))

lines(x = rep(
  mean(c(res_left, res_left + dens_width)), 
  times = 2), 
  y = c(c_m, arrow_bend_y), lty = 'dotted')

arrows(x0 = center, y0 = arrow_bend_y, 
  x1 = center + 0.15, lty = 'dotted')

# Allocated Capital ----

center <- 1.75

rect(xleft = center - 0.1, ybottom = 0, xright = center + 0.1, 
  ytop = scale - (c_m - d_x[43]), border = 'red')

rect(xleft = center - 0.1, ybottom = scale - (c_m - d_x[43]), 
  xright = center + 0.1, ytop = scale , col = 'grey90', lty = 'dotted')

text(x = center, y = mean(
  c(scale, 
    scale - (c_m - d_x[43])
  )), 
  label = 'Reserves\n(Segregated\nCapital)', cex = 0.7)

text(x = center, y = 5, label = 'Working Capital', cex = 0.7, col = 'red')

text(x = center, y = 1.05 * scale, label = 'Available Capital', cex = 0.7)

rate