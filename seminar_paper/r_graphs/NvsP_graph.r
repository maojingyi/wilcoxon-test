protsent5 <- c(0, 0, 0.25, 0.25, 0.0625, 0.0625, 0.015625, 0.015625, 0.01953125, 0.01953125, 0.0185546875, 0.02099609375, 0.01708984375, 0.0198974609375, 0.01763916015625, 0.017669677734375, 0.0167694091796875, 0.01739501953125, 0.017116546630859375, 0.016170501708984375, 0.014787673950195312, 0.014507293701171875, 0.015058755874633789, 0.013837099075317383, 0.013463854789733887, 0.013739705085754395, 0.01359790563583374, 0.013115473091602325, 0.012374557554721832, 0.012167103588581085, 0.011705071665346622, 0.011671178508549929, 0.011393355904147029, 0.01091800769791007, 0.010799358657095581, 0.010489973879884928, 0.010480126467882656, 0.010287958590197377, 0.00994271996387397, 0.009856305416178657, 0.009622770078749454, 0.009266728362035792, 0.009132639142080734, 0.008880110263817187, 0.008818260418536283, 0.008642676015568895, 0.008370030997838285, 0.008264843662011856, 0.00806605007142025, 0.008013869282724073)
protsent10 <- c(0, 0, 0.25, 0.125, 0.0625, 0.03125, 0.015625, 0.015625, 0.01953125, 0.01953125, 0.013671875, 0.01611328125, 0.013427734375, 0.0133056640625, 0.01226806640625, 0.012786865234375, 0.0106964111328125, 0.01007843017578125, 0.010406494140625, 0.010206222534179688, 0.009616851806640625, 0.008773326873779297, 0.008600473403930664, 0.008155584335327148, 0.008203327655792236, 0.007361024618148804, 0.0070032477378845215, 0.007002867758274078, 0.006811849772930145, 0.006471583619713783, 0.006023811176419258, 0.005852485541254282, 0.005901310360059142, 0.005503264372237027, 0.0053277474362403154, 0.00506595490151085, 0.004979490069672465, 0.0048081493223435245, 0.004569520409859251, 0.004473680211958708, 0.004311326349125011, 0.004267468323632784, 0.004159160429935582, 0.003997309091687384, 0.003793187119185859, 0.0036884955063669622, 0.003541533232009897, 0.003477289061784461, 0.0033717457314033084, 0.0033371576227683164)
protsent20 <- c(0, 0, 0.25, 0.125, 0.0625, 0.03125, 0.015625, 0.015625, 0.0078125, 0.009765625, 0.009765625, 0.00927734375, 0.008056640625, 0.0067138671875, 0.0067138671875, 0.0062255859375, 0.0054931640625, 0.0054931640625, 0.004482269287109375, 0.004726409912109375, 0.004154205322265625, 0.004004955291748047, 0.0037217140197753906, 0.003355264663696289, 0.003258049488067627, 0.0030646026134490967, 0.002806439995765686, 0.0025116726756095886, 0.0023890770971775055, 0.0023939814418554306, 0.002169116400182247, 0.00206967256963253, 0.0019327958580106497, 0.0018880220595747232, 0.0018046742188744247, 0.001692301477305591, 0.0015601065970258787, 0.001495962220360525, 0.0014096820887061767, 0.0013758051609329414, 0.0012564532562464592, 0.0012457423358682718, 0.001159494972853281, 0.0011136915243241674, 0.0010543802513325318, 0.0009851803896196998, 0.0009471542182666326, 0.0008985760863780001, 0.0008749950821176355, 0.0008407958221159362)
protsent50 <- c(0, 0, 0.25, 0.125, 0.0625, 0.03125, 0.015625, 0.0078125, 0.00390625, 0.00390625, 0.001953125, 0.00244140625, 0.001708984375, 0.001708984375, 0.00115966796875, 0.001007080078125, 0.0008392333984375, 0.0008392333984375, 0.000644683837890625, 0.0005855560302734375, 0.0005083084106445312, 0.0005011558532714844, 0.00040459632873535156, 0.0003688335418701172, 0.0003249049186706543, 0.00027820467948913574, 0.0002623051404953003, 0.00023937225341796875, 0.00021248310804367065, 0.0001841820776462555, 0.0001724790781736374, 0.0001432676799595356, 0.00014020013622939587, 0.00012245948892086744, 0.00011406681733205914, 0.00010392963304184377, 9.286028216592968e-05, 8.153369708452374e-05, 7.56254157749936e-05, 6.883612331876066e-05, 6.160464454296743e-05, 5.785305347671965e-05, 5.336693811841542e-05, 4.843930014430953e-05, 4.5885706413173466e-05, 4.042906576273708e-05, 3.7147530065340106e-05, 3.546572633439382e-05, 3.1671266519595065e-05, 2.937112857104296e-05)

X11.options(type="nbcairo")

plot(protsent5, type="o", col="blue", xlim=c(10, 50), ylim=c(0, 0.02), xlab="N", ylab="P")
lines(protsent10, type="o", pch=22, lty=2, col="red")
lines(protsent20, type="o", pch=22, lty=2, col="yellow")
lines(protsent50, type="o", pch=22, lty=2, col="green")
title(main="P approximate value when under certain error threshold")

leg <- c("P approx error < 5%", "P approx error < 10%", "P approx error < 20%", "P approx error < 50%")
cols <- c("blue", "red", "yellow", "green")
legend(30, 0.02, leg, cex = 1, cols, pch=22, lty=1:2)
