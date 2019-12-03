import UIKit

var modules: [Double] = [60077,
148191,
77039,
138122,
109889,
140187,
116411,
94170,
149976,
70913,
64860,
149414,
146246,
143889,
105615,
143060,
82445,
108411,
54193,
102892,
136407,
147470,
129652,
75887,
104208,
131104,
82815,
72880,
104513,
64130,
112780,
71099,
108700,
137290,
53878,
146277,
68897,
118713,
141895,
74593,
111125,
62545,
114375,
140815,
137314,
129250,
78915,
63391,
133745,
99785,
104597,
140050,
118183,
67394,
84529,
82530,
109998,
126649,
56545,
139507,
71148,
71421,
99495,
59804,
118055,
110401,
84557,
69630,
130090,
110550,
115260,
88256,
97149,
62192,
142398,
85462,
132228,
102567,
67005,
54685,
83284,
142337,
117615,
90445,
78048,
68070,
99049,
83965,
124845,
76143,
96194,
92299,
128558,
64150,
85126,
63567,
103223,
125883,
58363,
72622];

func fuelForWeight(_ weight: Double) -> Double {
    return floor(weight / 3.0) - 2;
}

func totalMassForModule(_ module: Double) -> Double {
    var fuel = fuelForWeight(module);
    var totalFuel = fuel;
    // Calculate fuel weight
    while(fuel >= 0) {
        fuel = fuelForWeight(fuel);
        totalFuel += max(0, fuel);
    }
    return totalFuel;
}

// 1a
let massWithOutFuel = modules.reduce(0) { (mass, module) in
    mass + fuelForWeight(module);
}
print(massWithOutFuel);

// 1b
let massWithFuel = modules.reduce(0) { (mass, module) in
    mass + totalMassForModule(module);
}
print(massWithFuel);
