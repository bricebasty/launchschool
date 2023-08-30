require 'benchmark'

def find_outlier_v1(integers)
  integers.partition(&:odd?).find(&:one?).first
end

def find_outlier_v2(integers)
  outlier = integers.first(3).count(&:even?) < 2 ? :even? : :odd?
  integers.find(&outlier)
end

def find_outlier_v3(integers)
  integers.count(&:even?) > 1 ? integers.find(&:odd?) : integers.find(&:even?)
end

def find_outlier_v4(integers)
  integers.map(&:even?).one?(false) ? integers.select(&:odd?)[0] : integers.select(&:even?)[0]
end

# Generate a sample array with both odd and even numbers
sample_array = [66342748, -46022271, 134389049, -22665927, -174321249, -158071607, 100991121, -37224557, 30914139, -9542027, -53149, -82984435, 78382099, 7728307, 51663525, 98815803, -148767929, 169572185, -82098881, 187631969, 168506165, 190257737, 185955697, 192821887, -74557135, -93670073, -72134797, -26662677, -78477381, -176965669, 26872281, 104804599, 85579045, -29986071, -42254323, -90051771, -194705395, -27553033, 40884163, -145252747, 103887467, 27403617, -59681747, -95496131, -78379955, 182969641, -26256113, -142461293, 75465785, -118944761, 46819413, 53255945, 194276803, 63252761, 196600915, 190078379, -131725423, 184833131, 139597323, -1966335, -58113609, 66672515, -117049489, 93788243, -148192897, -137222179, -56745533, -186664853, -25035093, -6125333, -248677, -132782395, 106479217, 4341993, -58287771, 163378139, -110717853, 108088889, -174685079, -39599617, -160349195, 21122357, 122261809, -52398441, 169240839, 75172877, 105737893, -3374011, -59176761, -145656245, -51260477, -118180169, -145787131, 36858461, 21883383, 61079261, 79507911, -137450555, 136228201, -135855693, -4218543, -193794879, -11908161, 188248539, 17323589, -97733549, -108816281, -121593383, 72444415, 154457493, -99097549, 55064107, 13602735, 134757621, 169889765, 152243953, 13999937, -62306393, -24753499, -139716141, -62228647, 198655, 61600975, -35459987, 67328747, 127863155, -152230359, -58881683, 73412229, -93099927, 32289515, 135358479, 178395643, 60229343, 111370433, -18886965, 66497183, 119200281, -95495895, -66890591, 160504311, -167786065, -155411693, 111306005, 15792545, -96273195, -159077577, 194621953, -11063959, -78000731, -89594163, -54393773, -191233915, 164059203, -165571215, 82705639, 196648687, -64675237, -89954449, -99432045, -170093145, -186920159, -178384441, -175139127, -198456943, 127878511, -6486827, -95033439, 170222977, -95430983, 99320851, -194338675, -156340989, 145851673, 186157849, 37670911, -61296093, 67230009, -76402297, -139362919, 118007271, -100137217, 136537063, 26347123, -55261117, -131045701, 607473, 68166291, -166425447, -179287827, 149777533, -65225193, -67311339, 88739615, 94780903, 56330253, 157829977, -24350347, 13753955, 111076949, 4127547, 104565925, 40009745, -167842489, 136620379, -153439487, -16730933, 140046421, -129192247, 75652117, -136976155, -111217967, 47685671, 63274747, -51969497, -170899633, 34389825, -146721411, -101806605, 190163163, 118959847, -70658057, -104870621, -104845441, 79096905, 25695791, 93985875, -66511637, -26383917, 126632733, -108198509, -112838583, -151434035, 48952985, 137207435, -148992011, 193105039, 28854469, 69458417, -73776477, -91066411, 173419095, -119953841, -49833161, 92747091, -14698441, 54553941, -194455857, 121653269, -61818093, -105635639, 6218645, 128271817, 196469177, 98427537, -39571353, 158997879, -177936227, 140282599, 92842571, 17685879, -5756837, -59750665, 149265593, 78354291, 84045597, 151164547, -131534383, -153444269, -21235347, -111786315, 68811985, 97144655, 159174499, 190285653, 195703945, 15531169, 8688699, -158384731, 54176211, -183065655, 24254137, -133245141, 180095373, -152785235, 164135457, 39264291, 23334251, 59972889, 134580429, 168823435, 151490813, 127660751, 51300661, -175639345, -87947719, 27333347, -24645373, -34418243, -162317523, 22620957, 45615387, 141205187, 43742057, -107470919, 172816543, 21665783, -133141685, -154526897, -107001029, -122789397, 23173963, -30056469, -56878529, 139567743, 87182815, -151329225, -133963275, 87980699, -24758479, 98515681, 136775555, -130575697, -35606873, 166571441, -181103303, -18638895, 121196695, 83934943, 69235047, 189122449, 24641587, 173565683, 189091845, -124311305, 79939977, 175257113, 100970315, -13104029, 186791807, -157426859, 82000517, 188398051, -96653645, 156675885, 5728323, 17448153, -153033763, 54942357, -79864343, -64648755, 22439751, 72527965, 120493757, -120246817, 51328839, 60378537, -191734993, 123510843, 98071453, -150055437, 122800379, -193484839, 88662563, 92162849, -22926551, 125404349, 45088499, 62812807, -115874629, -138017685, -17717549, -30799547, -120778853, 187603563, 145455003, 169346393, -118659233, -143439807, 195350833, -139716683, 156992853, -63903249, 85492439, -139509009, -175542433, 69758429, 68707173, 39102411, 93108489, 99008795, -62001441, -21571311, -117825915, 2819615, -82694751, -2088503, 167582529, -42765113, -48919079, -121780321, -131738763, 127066129, -150054007, -17123521, 114563283, 181076993, -41512589, 63409861, -149645593, -133184649, 76654117, 128618679, 22982949, -3580855, -133400295, -65241941, 100582943, -171811515, 8209461, 187598767, 147237585, -92441195, -191763681, 155790361, 17884931, 118108621, -20309789, 16544655, 34927969, -7294399, -176199771, -111783093, -70628437, -163960897, -42669005, 175704609, -130091361, 120859955, -104841175, 170804343, -130332873, 134443721, -50190285, 127048869, 11214077, -138441905, -149158221, 135934753, -2728983, 133881587, 111957921, 154600573, 116435573, -102215731, 28431879, 175453071, -199501337, 113687421, 1881599, -69765359, -89513689, -135796715, 109886683, 67686699, -50373331, 11902703, -130542783, -149738079, -38069623, 90692685, -94910583, 32538101, -42230201, 93257913, 178137847, 14474793, 110422531, -110108559, -152350999, 189746737, 8866583, 96150027, 4088463, -163788499, -105372555, -171452747, -116323367, 170597455, -69731893, -127763889, 9858575, -32008265, -174035035, 78450779, 115206265, 68753799, 151780125, 111375051, 17992875, -145991841, 624955, 106398313, 146894781, 56281199, -64079609, -16160453, -183594657, -189617165, 69669119, -183699785, -135431021, 50497769, -16726827, -34031487, 166731803, 46223789, 183267657, 20852603, 156041985, 7653855, 154498449, 85960735, -193004391, -154453443, -13962369, -63692613, -81039327, 144493455, -74553355, 133783377, 172050379, 54858009, -185330967, 14332835, -123385529, -143075983, -151484675, -143572797, -114501651, 40295085, -107249933, -47887995, 91455003, -166777761, 149981643, -25671403, 124985209, -125647463, -99224673, 90362575, -156218467, 184739441, 59308769, -5140433, -143713369, -100698799, 10974807, 87358767, 82128837, -173998111, -102248509, 54206635, 149776173, -138235183, -126870097, -165802611, 76471019, 197854459, 188264515, 126361923, 89238633, 102649425, 135320563, 84706779, -156484961, 67692499, -25193823, 25518345, 190787569, -74353311, -199161255, -118418293, 7571649, -131220381, 42916235, 166138675, 79514161, 181236187, 193291703, 17480513, 144669051, 125207059, -121615381, 109320141, 9089785, -70400683, 68049379, -174968531, -172100997, 41715841, 156793883, 101559945, 148848231, -66962965, -145226083, 175824121, -96133349, -119860469, -128865937, -21117349, 175460899, 169709085, 8714025, 68668849, 58108455, 86610869, -29717183, -132499137, -156808921]


Benchmark.bm(15) do |x|
  x.report("Version 1:") { find_outlier_v1(sample_array) }
  x.report("Version 2:") { find_outlier_v2(sample_array) }
  x.report("Version 3:") { find_outlier_v3(sample_array) }
  x.report("Version 4:") { find_outlier_v4(sample_array) }
end
