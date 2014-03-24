kasitsiTabel <-c( 0, 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210, 231, 253, 276, 300, 325, 351, 378, 406, 435, 465, 496, 528, 561, 595, 630, 666, 703, 741, 780, 820, 861, 903, 946, 990, 1035, 1081, 1128, 1176, 1225)
pihta <- c(0, 0, 2, 3, 9, 12, 21, 26, 30, 35, 41, 46, 54, 59, 67, 74, 82, 89, 97, 106, 116, 125, 133, 144, 154, 163, 173, 184, 196, 207, 219, 230, 242, 255, 267, 280, 292, 305, 319, 332, 346, 361, 375, 390, 404, 419, 435, 450, 466, 481)

#X11.options(type="nbcairo")
plot(kasitsiTabel, type="o", col="blue", ylim=c(0, 1300), xlab = "N", ylab="K")
lines(pihta, type="o", pch=22, lty=2, col="red")

title(main="P = 0 and P approximate tail comparisson")
leg <- c("P = 0", "P approximate error < 5%")
cols <- c("blue", "red")
legend(0, 1300, leg, cex = 1, cols, pch=22, lty=1:2)
