## ---- echo=FALSE, fig.show='hold', fig.height = 7, fig.width = 7---------
cat("hellow friend\n")
library('snowflakes')
#data('snowflakes')
########### make transparent color
colorCoord = as.hexmode(col2rgb("blue"))
transpBlue =paste("#", paste(colorCoord, collapse=""), "44", sep="")
colorCoord = as.hexmode(col2rgb("white"))
transpWhite =paste("#", paste(colorCoord, collapse=""), "66", sep="")

numSnowflPerRow = 5
selectSeeds = sample(1:100000, numSnowflPerRow^2)
xCoor = rep(1:numSnowflPerRow, numSnowflPerRow)
yCoor = rep(1:numSnowflPerRow, each = numSnowflPerRow)
radius = .4

par(mar = c(0, 0, 0, 0))
plot(range(xCoor)+c(-1, 1)*.5, range(yCoor)+c(-1, 1)*.5, type="n", axes = FALSE, ylab="", xlab="")
snowflakes(xCoor = xCoor[1], yCoor = yCoor[1], radius = radius, color = transpBlue, anotherColor = "#33333333", seeds = selectSeeds[1])
for (i in 2:numSnowflPerRow^2){
  snowflakes(xCoor = xCoor[i], yCoor = yCoor[i], radius = radius, color = transpBlue, anotherColor = "#33333333", seeds = selectSeeds[i])
	snowflakes(xCoor = xCoor[i-1], yCoor = yCoor[i-1], radius = radius, color = transpWhite, anotherColor = transpWhite, seeds = selectSeeds[i-1])
	text(xCoor[i-1], yCoor[i-1], selectSeeds[i-1], cex=.5, pos = 3)
}

snowflakes(xCoor = xCoor[i], yCoor = yCoor[i], radius = radius, color = transpWhite, anotherColor = transpWhite, seeds = selectSeeds[i])
text(xCoor[i], yCoor[i], selectSeeds[i], cex=.5, pos = 3)

