module debjit_rom ( input [11:0]	addr,
						output [23:0]	data
					 );

	parameter ADDR_WIDTH = 12;
   parameter DATA_WIDTH =  24;
	logic [ADDR_WIDTH-1:0] addr_reg;
				
	// ROM definition				
	parameter [0:2499][23:0] ROM = {
		24'hfcfcfc,
		24'hfdfdfd,
		24'hfefefe,
		24'hfefefe,
		24'hfefefe,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hfdfdfd,
		24'hffffff,
		24'hfbfbfb,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hfdfdfd,
		24'hfdfdfd,
		24'hfefffa,
		24'hfdfef9,
		24'hfefefc,
		24'hfdfffc,
		24'hfdfffe,
		24'hfeffff,
		24'hfcfdff,
		24'hfbffff,
		24'hfdfeff,
		24'hfafbfd,
		24'hfafbfd,
		24'hfdfdff,
		24'hffffff,
		24'hfdfdfd,
		24'hfbf9fa,
		24'hfffdfe,
		24'hfcfcfc,
		24'hfdfdfd,
		24'hfcfcfc,
		24'hfcfcfc,
		24'hfefefe,
		24'hfdfdfd,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hfdfdfd,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hfdfdfd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hfdfdfd,
		24'hfefefe,
		24'hffffff,
		24'hfefeff,
		24'hfefeff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfdfdfd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfbfbfd,
		24'hffffff,
		24'hfffeff,
		24'hfcfafd,
		24'hfffdfe,
		24'hfffeff,
		24'hfffeff,
		24'hfffefd,
		24'hfffdfc,
		24'hfefdfb,
		24'hfffeff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hfefefe,
		24'hfcfcfc,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfdfdfd,
		24'hfefefe,
		24'hffffff,
		24'hfefefe,
		24'hfdfdfd,
		24'hfcfcfe,
		24'hffffff,
		24'hfffeff,
		24'hfffffd,
		24'hfffefd,
		24'hfffbf8,
		24'hf7f2ef,
		24'hfbf3f1,
		24'hf7f2ee,
		24'hfffcf9,
		24'hfffefb,
		24'hfffcfb,
		24'hfffdfe,
		24'hffffff,
		24'hfdfdff,
		24'hfdfeff,
		24'hfdfdfd,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hfdfdfd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfdfdfd,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hfffffb,
		24'hfdfcf8,
		24'hcccbc7,
		24'ha19e99,
		24'h98938f,
		24'h716c66,
		24'h403933,
		24'h39322c,
		24'h3d3532,
		24'h615c58,
		24'h8a8581,
		24'h999592,
		24'hc5c4c2,
		24'hfaf8f9,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfbfbfb,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hfcfcfc,
		24'hf8f8f8,
		24'hffffff,
		24'hfefefe,
		24'hcac9c4,
		24'h696863,
		24'h35342f,
		24'h3d3a35,
		24'h3b3831,
		24'h2f2a24,
		24'h29241e,
		24'h241f19,
		24'h1813f,
		24'h1b1612,
		24'h25201c,
		24'h1d1815,
		24'h292522,
		24'h565251,
		24'h9a9997,
		24'hf3f2f0,
		24'hffffff,
		24'hffffff,
		24'hf9f9f9,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hc8c8c8,
		24'h45423d,
		24'h2c2825,
		24'h2a2623,
		24'h322e2b,
		24'h2f2b28,
		24'h2b2724,
		24'h2a2625,
		24'h2a2625,
		24'h282320,
		24'h241f1c,
		24'h231e1b,
		24'h1b1613,
		24'h1a1512,
		24'h1a1512,
		24'h1c1714,
		24'h2e2926,
		24'hbfbfbf,
		24'hfdfdfd,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hfcfcfc,
		24'hc4c4c4,
		24'h3f3f3f,
		24'h2a2625,
		24'h373332,
		24'h3c3837,
		24'h302c2d,
		24'h2c2a2b,
		24'h353336,
		24'h312f32,
		24'h282629,
		24'h231f1c,
		24'h26221f,
		24'h2b2623,
		24'h2f2a26,
		24'h2a2521,
		24'h201815,
		24'h17fc,
		24'h11a4,
		24'h2b2b2b,
		24'hbbbbbb,
		24'hf9f9f9,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfffcf7,
		24'hfcffff,
		24'hfcffff,
		24'hfffffa,
		24'hf0f2ef,
		24'h8a857f,
		24'h483d39,
		24'h2f2e34,
		24'h363d45,
		24'h424244,
		24'h554a44,
		24'h5e4b3d,
		24'h5b4432,
		24'h61503c,
		24'h5f5742,
		24'h464330,
		24'h2b2c2e,
		24'h373634,
		24'h3c3733,
		24'h463d36,
		24'h403730,
		24'h2e2925,
		24'h1d1b1c,
		24'h1a1b1f,
		24'h101511,
		24'h191516,
		24'h665d5e,
		24'hfcf7f1,
		24'hfefdf9,
		24'hfffeff,
		24'hfafbff,
		24'hfefffb,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefffb,
		24'hfafcfb,
		24'hfffdfa,
		24'hf1e7e5,
		24'h877e7f,
		24'h3c3431,
		24'h38312b,
		24'h3c3b37,
		24'h4c412f,
		24'h7b6953,
		24'ha6886c,
		24'hba9372,
		24'hc39772,
		24'hc99d7a,
		24'hc59d7a,
		24'hb99575,
		24'ha07d5f,
		24'h9c775a,
		24'ha07b5e,
		24'h947155,
		24'h775941,
		24'h5f4836,
		24'h3e2e21,
		24'h2e241b,
		24'h1b1813,
		24'h171312,
		24'h11bb,
		24'h645d57,
		24'hfffdfa,
		24'hfeffff,
		24'hfeffff,
		24'hfdfef9,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hf6feff,
		24'hfffffa,
		24'hf5ece7,
		24'h7b7170,
		24'h3c3334,
		24'h403a3a,
		24'h423a37,
		24'h59493c,
		24'h98704c,
		24'hb88d63,
		24'hca9a6c,
		24'hd19c68,
		24'hdca36e,
		24'he3a773,
		24'he0a676,
		24'hdfa577,
		24'he2a674,
		24'hdda16f,
		24'he0a472,
		24'hd99f71,
		24'hc49166,
		24'hb28663,
		24'h8c674a,
		24'h74543b,
		24'h36281d,
		24'h221d19,
		24'h161513,
		24'h221816,
		24'hc0b8b6,
		24'hfcfdff,
		24'hfcffff,
		24'hfffefd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfcffff,
		24'hfbeee8,
		24'h857b72,
		24'h3d3c38,
		24'h3e3d39,
		24'h3e3c3d,
		24'h574a44,
		24'h9a745d,
		24'hc78c64,
		24'hcd9266,
		24'hd39969,
		24'hdca56f,
		24'he3ae78,
		24'he6b17b,
		24'he3af7d,
		24'hdca878,
		24'hdfab7c,
		24'he4ae7f,
		24'hdda373,
		24'hdca270,
		24'hdba171,
		24'hd09a6c,
		24'hbb885d,
		24'ha6754c,
		24'h6f5240,
		24'h332c22,
		24'h282826,
		24'h16cb,
		24'h342927,
		24'hf1f3f2,
		24'hfbffff,
		24'hfffefd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfbfbff,
		24'had9e97,
		24'h4d4037,
		24'h4a4945,
		24'h4c4b47,
		24'h4b4744,
		24'h746153,
		24'hb78666,
		24'hcb9066,
		24'hce9568,
		24'hd7a172,
		24'he2b07f,
		24'he3b382,
		24'he1b381,
		24'he2b483,
		24'hdeaf81,
		24'hddb087,
		24'he6b78d,
		24'he0ad80,
		24'he1ab7c,
		24'hdea677,
		24'hd79f70,
		24'hcf9768,
		24'hc48e5f,
		24'ha27b5e,
		24'h574a3a,
		24'h323230,
		24'h322829,
		24'h1f1110,
		24'h8f8e8a,
		24'hfcffff,
		24'hfffcfd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hf5f9f8,
		24'h554c43,
		24'h42342b,
		24'h4c413d,
		24'h534b49,
		24'h4f453c,
		24'h8d735c,
		24'hb98c62,
		24'hc99968,
		24'hd1a170,
		24'hd6a675,
		24'hdeac7b,
		24'he4b281,
		24'he5b182,
		24'he6b082,
		24'he6ad80,
		24'he4b182,
		24'he1ad7d,
		24'he7b182,
		24'he7b280,
		24'hdaa573,
		24'hd8a273,
		24'hd09c6d,
		24'hcb966a,
		24'hb3835d,
		24'h604b38,
		24'h3e3d3b,
		24'h3c3636,
		24'h251a16,
		24'h5c5753,
		24'hf6f6f4,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hf5f2eb,
		24'h48433d,
		24'h463931,
		24'h40352f,
		24'h39312e,
		24'h59493a,
		24'h9a7654,
		24'hcb9c6e,
		24'hce9f69,
		24'hd1a26e,
		24'hcf9d6a,
		24'hd4a070,
		24'he0aa7b,
		24'he4ae7f,
		24'he9b182,
		24'heab281,
		24'he4af7b,
		24'hdaa571,
		24'hdfa774,
		24'he0ab79,
		24'hd5a06e,
		24'hd29e6e,
		24'hcf9b6c,
		24'hce9b6c,
		24'hc18c60,
		24'h755944,
		24'h544e4e,
		24'h414141,
		24'h2c231e,
		24'h2f2420,
		24'hc6c2c1,
		24'hfafefd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hb9a8a0,
		24'h3f3a36,
		24'h3e372f,
		24'h3e3a2f,
		24'h2b2c26,
		24'h756450,
		24'hc1946d,
		24'hd09a6e,
		24'hce9967,
		24'hd19c6a,
		24'hd8a273,
		24'he3af80,
		24'he3b081,
		24'hdcac7c,
		24'hddaf7d,
		24'hddb27f,
		24'hdeae80,
		24'hdfaf7f,
		24'hdaa778,
		24'he3af7f,
		24'hdaa676,
		24'hca9465,
		24'hcc9765,
		24'hcf9a68,
		24'hc78f5e,
		24'h9e7b65,
		24'h5b5253,
		24'h424443,
		24'h312a24,
		24'h32231e,
		24'h9c9492,
		24'hfbffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hae9e91,
		24'h3c3e30,
		24'h322f28,
		24'h32201c,
		24'h533e2d,
		24'hb08c6c,
		24'hd19c70,
		24'hcf9862,
		24'hce9a6b,
		24'hdca56d,
		24'hedb884,
		24'hecbc94,
		24'hf3c7a2,
		24'hf6c396,
		24'hf0ba8b,
		24'heeb98f,
		24'hf6b887,
		24'hf9bf9a,
		24'hefbd9a,
		24'hf3c297,
		24'heeb685,
		24'he5a67b,
		24'hd09b71,
		24'hc09a69,
		24'hd2996c,
		24'hc1946d,
		24'h624d3c,
		24'h35312e,
		24'h342c2a,
		24'h2d2220,
		24'h8f8b88,
		24'hfffef9,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hb5a198,
		24'h3f3432,
		24'h282629,
		24'h413529,
		24'ha8825b,
		24'hd29e6f,
		24'hc2956c,
		24'hab8e64,
		24'hb39883,
		24'hc0aa85,
		24'hc2aa86,
		24'hcba892,
		24'he5c3a7,
		24'hf6dcb7,
		24'hf8dbb9,
		24'hfad6b6,
		24'hf2deb9,
		24'hfadfc4,
		24'hf5d2bc,
		24'hdebfa0,
		24'hcbb18c,
		24'hd7b997,
		24'hd0aa86,
		24'hbb8e64,
		24'hca9465,
		24'hc59f70,
		24'hae845e,
		24'h513625,
		24'h3b3c40,
		24'h251a1e,
		24'h442c2c,
		24'hf4f5f9,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hbca7a2,
		24'h382529,
		24'h221e1b,
		24'h816c4d,
		24'hcc9960,
		24'hc59263,
		24'h9e7e67,
		24'h816e5f,
		24'h7f6f60,
		24'h747266,
		24'h6f7269,
		24'h847a71,
		24'hbaa18d,
		24'he1c59e,
		24'hf5dcb3,
		24'hfce1c4,
		24'hf8e1b8,
		24'hf1d5b0,
		24'hd9bc9a,
		24'hb09c81,
		24'h7d756a,
		24'h706c6b,
		24'h84756e,
		24'h8e745b,
		24'ha57c5c,
		24'hc29760,
		24'hcb915f,
		24'h99705c,
		24'h45423d,
		24'h22191c,
		24'h442d33,
		24'hf4f4f4,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hac9f8e,
		24'h39302b,
		24'h342e1e,
		24'ha37c5b,
		24'hbf8a68,
		24'h93795e,
		24'h907a6c,
		24'ha6847b,
		24'ha9957d,
		24'hb3988f,
		24'hb29c8e,
		24'haaa393,
		24'hccc7c4,
		24'hd0bfaf,
		24'hd9b990,
		24'hfbd2a6,
		24'hf5c597,
		24'hddb995,
		24'hc9b197,
		24'h978674,
		24'h81726d,
		24'h817277,
		24'h7b6967,
		24'h927b6d,
		24'h927162,
		24'haa7f55,
		24'hcb946b,
		24'had836b,
		24'h5a4c3f,
		24'h2c2626,
		24'h463f46,
		24'hf7f8f0,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hb5b291,
		24'h35322d,
		24'h453d30,
		24'h8f624f,
		24'h68413a,
		24'h887c70,
		24'hc7ac91,
		24'hd1aa8d,
		24'hc19c82,
		24'hcaa18f,
		24'hdebeb3,
		24'he6d9d3,
		24'he2dedd,
		24'hcfc4c0,
		24'hbba28c,
		24'hd0b28c,
		24'hc7a582,
		24'hbfafa2,
		24'he0dbdf,
		24'hd0c4c4,
		24'hccb6a9,
		24'hd4b8a3,
		24'hc29f89,
		24'hca9d86,
		24'hb99481,
		24'h9b806b,
		24'ha37c5b,
		24'ha97e5c,
		24'h685648,
		24'h363435,
		24'h464648,
		24'hd7dddd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hdbd7cb,
		24'h41343d,
		24'h463930,
		24'h745036,
		24'had9277,
		24'hbfae90,
		24'hd0a384,
		24'haa896a,
		24'ha28178,
		24'h7f7168,
		24'h99939f,
		24'hdbcddc,
		24'hd2bcae,
		24'hd3b9aa,
		24'hb7a098,
		24'hbdaa8c,
		24'hae9078,
		24'haa9e90,
		24'hd3cfcc,
		24'hd3c9c7,
		24'hbcafa9,
		24'ha89e92,
		24'ha99481,
		24'hae896f,
		24'hcda581,
		24'hc1a689,
		24'h785d3f,
		24'h87633f,
		24'h785c47,
		24'h332a2b,
		24'h2e2e36,
		24'hb8b3b7,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfaf4f8,
		24'h654749,
		24'h513f29,
		24'hb28f65,
		24'he8c88f,
		24'hd0b987,
		24'hbb8b75,
		24'h937364,
		24'haf9c98,
		24'h9b8c87,
		24'ha28f93,
		24'hd5bbbc,
		24'hd2b6a8,
		24'hc3a799,
		24'hb6937f,
		24'hd9ae83,
		24'hc49579,
		24'hba9f82,
		24'hc6b49c,
		24'hdbc5b8,
		24'h948485,
		24'h6a676e,
		24'hb3aaa5,
		24'h8e715f,
		24'hb78a63,
		24'hdbb68c,
		24'hd4b390,
		24'ha78562,
		24'h7c5b3a,
		24'h311f13,
		24'h302424,
		24'ha79589,
		24'hfcfcfc,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfffaf4,
		24'hb49076,
		24'h6b532f,
		24'hc2926e,
		24'he7b47b,
		24'hcab482,
		24'hba9384,
		24'ha78272,
		24'hb88d62,
		24'hcb998e,
		24'hcea393,
		24'hd5b79b,
		24'hd6b8ad,
		24'hb89182,
		24'hba8d64,
		24'hddae80,
		24'hd4a281,
		24'hab8d75,
		24'hc8ada2,
		24'hd6b1ab,
		24'hcea9a1,
		24'hb9a197,
		24'hb69488,
		24'haf7768,
		24'hc58965,
		24'hd3b088,
		24'he8bb92,
		24'hc99870,
		24'h74603f,
		24'h70583e,
		24'h9b765c,
		24'ha79273,
		24'hf9f9f9,
		24'hfcfcfc,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hf5dbc0,
		24'hac846a,
		24'h5d4b3f,
		24'hae8b63,
		24'hdab07e,
		24'hdcaf85,
		24'hcea381,
		24'hb98c65,
		24'hac8e83,
		24'hbb977f,
		24'hcaa384,
		24'hd0ac92,
		24'hc2a38f,
		24'h9f7d62,
		24'hc79773,
		24'hf1b289,
		24'hd49e7a,
		24'hb5855f,
		24'hc19e7e,
		24'hc8b49b,
		24'hcfbba3,
		24'hd3b094,
		24'hbf9271,
		24'hc39476,
		24'hb8967a,
		24'hc39574,
		24'he0ad76,
		24'hc39466,
		24'h6e5a42,
		24'h9b7e60,
		24'hdfa482,
		24'hc6a390,
		24'heaeaea,
		24'hfdfdfd,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfce5d3,
		24'h886a52,
		24'h4f453b,
		24'ha5815d,
		24'hd1a576,
		24'he1b88c,
		24'he4be99,
		24'hf3c29a,
		24'heab485,
		24'he9af87,
		24'he9b289,
		24'he5b382,
		24'hbf9064,
		24'hae7d5c,
		24'hdda984,
		24'hfbc596,
		24'he0a27b,
		24'hb6845f,
		24'hb98f67,
		24'he2b387,
		24'hdead84,
		24'hdcae8a,
		24'hdaac8a,
		24'hdfaf87,
		24'he1b995,
		24'heaba96,
		24'he1b27e,
		24'hb38961,
		24'h5d4c3a,
		24'h7a5f42,
		24'he3a983,
		24'he1bda5,
		24'hefefef,
		24'hfefefe,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hebd7ce,
		24'haa917b,
		24'h4d463c,
		24'ha0795a,
		24'hd2a57b,
		24'hd9b585,
		24'he1be94,
		24'hf6c29a,
		24'hf3be8a,
		24'hf2be8c,
		24'hf0bd8e,
		24'he7b489,
		24'hd7a479,
		24'hd2a379,
		24'hf0c8a4,
		24'hf8d5b7,
		24'hf1b68e,
		24'hc28e67,
		24'hc49166,
		24'hf0b686,
		24'hf6b98a,
		24'hefba90,
		24'hf3c39b,
		24'hf5c69a,
		24'hf1c598,
		24'hf2c199,
		24'hddae80,
		24'had8665,
		24'h504033,
		24'h7e6346,
		24'he8ae86,
		24'hdebca0,
		24'hf7f7f7,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfdfdfd,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfdfdfd,
		24'he7d5cb,
		24'hcfb199,
		24'h4b3d30,
		24'h97704f,
		24'hc99e73,
		24'hd9b382,
		24'he0bb8f,
		24'hedbe92,
		24'hecc9a1,
		24'he8c699,
		24'hf5cea3,
		24'hdfb18f,
		24'hca9c7b,
		24'hc49a74,
		24'hf1d0af,
		24'hffe3cd,
		24'he4ba94,
		24'hd7a37c,
		24'he5ad88,
		24'heab998,
		24'hfbcfac,
		24'hf6c79d,
		24'hf4c599,
		24'heec399,
		24'he8bc8b,
		24'he4b48c,
		24'hd3a476,
		24'haa7f5f,
		24'h5e483a,
		24'hbd9e81,
		24'hf8c39b,
		24'hdec8b0,
		24'hfdfdfd,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hfefefe,
		24'hfefefe,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfcfcfc,
		24'he3d1c3,
		24'hecbfa2,
		24'h6f5240,
		24'h9b7550,
		24'hbf996c,
		24'hd7ab7a,
		24'he1b88a,
		24'heac193,
		24'heec899,
		24'hf8cba2,
		24'hf3bf97,
		24'hd7a276,
		24'hd6a57d,
		24'hbd9176,
		24'hc29a81,
		24'hd2af8f,
		24'ha78a68,
		24'hc59775,
		24'he1a88a,
		24'hdeac91,
		24'hf3cfad,
		24'hf7d2a6,
		24'hf6cba0,
		24'heec19a,
		24'hdfb688,
		24'hdcaf88,
		24'hd0a072,
		24'haa7853,
		24'h886853,
		24'hf8d4b2,
		24'hffd6b2,
		24'hfef7e7,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hfdfdfd,
		24'hcbbfaf,
		24'hd5a483,
		24'h8b6751,
		24'h9d7750,
		24'hbc976a,
		24'hd5a574,
		24'he2b385,
		24'he7c190,
		24'hf3c395,
		24'hf7c296,
		24'hdfaa80,
		24'hc29169,
		24'hb78c6c,
		24'hbd9981,
		24'hb4947d,
		24'hb6967d,
		24'haf9574,
		24'hbd9a7e,
		24'hc69577,
		24'he2aa85,
		24'hf3c297,
		24'hf6d1a7,
		24'hf4cda4,
		24'hefbc91,
		24'hddb488,
		24'hd1a580,
		24'hcb9b6b,
		24'hab764c,
		24'h997255,
		24'he6bf98,
		24'he8bd9b,
		24'hfafdf6,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hf6f2e9,
		24'hc8a182,
		24'h967762,
		24'ha07a56,
		24'hb79268,
		24'hd5a775,
		24'hdbad7b,
		24'he6b887,
		24'he0af8e,
		24'hcba47d,
		24'ha4825f,
		24'h96765f,
		24'ha4846d,
		24'hc9aa8d,
		24'hbea388,
		24'hbca092,
		24'hd0ad91,
		24'hbb9d83,
		24'haa886c,
		24'hc29774,
		24'hd0a07a,
		24'he6b894,
		24'hf1c49d,
		24'hecbc8e,
		24'hdeaf81,
		24'hce9e7a,
		24'hc09465,
		24'ha9784f,
		24'h967154,
		24'hc9a279,
		24'hc99e7c,
		24'hf6fbf7,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfeffff,
		24'he9ceb1,
		24'h96816c,
		24'h9d7657,
		24'hb8916a,
		24'hcda26f,
		24'hd8aa76,
		24'hdeaa7a,
		24'hc69a75,
		24'h93735c,
		24'h83715d,
		24'ha49075,
		24'hc5a783,
		24'he1b995,
		24'hd6ad8d,
		24'hc7a486,
		24'hdab19b,
		24'hc3a688,
		24'ha99a7d,
		24'h8c7d66,
		24'h93735e,
		24'hc59273,
		24'he5b086,
		24'he2b78a,
		24'hdfaa78,
		24'hd9a782,
		24'hbd9267,
		24'ha57952,
		24'h97785b,
		24'hc49f75,
		24'had805f,
		24'hf0f2ef,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hfefefe,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefff7,
		24'hfffcf8,
		24'ha89a99,
		24'h9c7055,
		24'hb08562,
		24'hd0a06f,
		24'hd3a97f,
		24'hd3a476,
		24'hb3926f,
		24'ha38d7f,
		24'h9a7d79,
		24'hc38d81,
		24'hd09182,
		24'hcd9b90,
		24'hcea89d,
		24'hcca691,
		24'hd0988b,
		24'hdb9887,
		24'hd19884,
		24'ha98e7d,
		24'h8f7f6f,
		24'haa886f,
		24'hddac84,
		24'he7b383,
		24'hdab17b,
		24'hd0a57b,
		24'hb8906d,
		24'h9e7a56,
		24'hb18761,
		24'hc1987c,
		24'hc4b0a5,
		24'hf5fbfb,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfdfef9,
		24'hfffeff,
		24'he1d9d7,
		24'h957254,
		24'ha88359,
		24'hc89c6d,
		24'hcda67f,
		24'hd6a779,
		24'hcfaf86,
		24'hbda486,
		24'ha88871,
		24'hb9836b,
		24'hca8774,
		24'hdc9c93,
		24'he6a39d,
		24'he99f96,
		24'hd29c90,
		24'hc78a75,
		24'hc59277,
		24'hac907a,
		24'ha18f79,
		24'hc0a385,
		24'he0b38c,
		24'he2b284,
		24'hd7b182,
		24'hcca176,
		24'hb58962,
		24'ha17b57,
		24'h8e6f53,
		24'hb8a18f,
		24'hfef3ed,
		24'hfefffd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfefffd,
		24'hfdfdff,
		24'hf7f5f6,
		24'h8d785d,
		24'h9b7b52,
		24'hbd966b,
		24'hbf9b77,
		24'hce9f73,
		24'hcfae85,
		24'hd0ae88,
		24'hc4a179,
		24'hc09874,
		24'hc49b7f,
		24'hd6ab9a,
		24'hdbaba1,
		24'he4aba2,
		24'hd7b4a0,
		24'hc5997c,
		24'hcc9a79,
		24'hcda083,
		24'hcda88d,
		24'hd1af8a,
		24'hd2b184,
		24'hceae7f,
		24'hd2ac85,
		24'hbf966a,
		24'hb88b61,
		24'h936c4d,
		24'h8b7567,
		24'hf3f0eb,
		24'hfeffff,
		24'hfffbfa,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfbfdfc,
		24'hfefffd,
		24'hfaffff,
		24'hbeb2a6,
		24'h997c5e,
		24'hb08e68,
		24'hb4946e,
		24'hc4996e,
		24'hc6a186,
		24'hd9ae8b,
		24'hdbb085,
		24'hceab81,
		24'hbaa280,
		24'ha9957c,
		24'h9a8570,
		24'h9d8772,
		24'hb6987c,
		24'hc6a37b,
		24'hd8a97f,
		24'he7b38e,
		24'he5b795,
		24'hcdab7e,
		24'hc9ad7d,
		24'hcdb084,
		24'hcaa27f,
		24'hb79268,
		24'ha88359,
		24'h8a684d,
		24'ha89a91,
		24'hf9ffff,
		24'hf8ffff,
		24'hfcfafb,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfcfcfa,
		24'hfefff6,
		24'hf9ffff,
		24'hf3eef4,
		24'h957463,
		24'h9d7f5b,
		24'hab926a,
		24'hb38e64,
		24'had8f77,
		24'hc9a080,
		24'hdaa67f,
		24'he1b088,
		24'hdaaf8d,
		24'hc3a084,
		24'hb39478,
		24'hb19276,
		24'hcea182,
		24'hdfb58b,
		24'hdcb888,
		24'hd1ae84,
		24'hcbac80,
		24'hc2a273,
		24'hc9a477,
		24'hd1a580,
		24'hc39876,
		24'hb08e69,
		24'h9c7f5f,
		24'h765a44,
		24'h837366,
		24'hf5f8f1,
		24'hfbffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfffffd,
		24'hfafcf1,
		24'hf9fffb,
		24'hfcfbff,
		24'h916c5a,
		24'h8b6d51,
		24'h9f8b6a,
		24'h9d7c59,
		24'h9b8669,
		24'haa8f71,
		24'hb58d6a,
		24'hc7966e,
		24'hd1a179,
		24'hd1a985,
		24'hd6b48f,
		24'hd9b791,
		24'hcea683,
		24'hcaa37a,
		24'hc8a77e,
		24'hb49a77,
		24'haf9572,
		24'hb89670,
		24'hbf9871,
		24'hc69b7b,
		24'hb38c6d,
		24'ha48568,
		24'h80664d,
		24'h907761,
		24'haf9a85,
		24'hc3b7a7,
		24'hf7f3ea,
		24'hfffffd,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfffdfe,
		24'hfcfbf9,
		24'hfcfffd,
		24'hfafbf3,
		24'hb08864,
		24'h80644e,
		24'h887564,
		24'h8f7459,
		24'h877257,
		24'h8c7d68,
		24'h9f8d77,
		24'hbf9e7d,
		24'hd2af89,
		24'hd6be9c,
		24'hdcc9a8,
		24'he2cca5,
		24'hd4bc96,
		24'hcbaa87,
		24'hc0a185,
		24'ha28b79,
		24'h997f6e,
		24'ha48068,
		24'had8a6c,
		24'had9476,
		24'h9f7f66,
		24'h8a6a53,
		24'h85674f,
		24'ha1876c,
		24'hcab095,
		24'hb49a83,
		24'hb4a294,
		24'hfdf6ec,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfffaff,
		24'hfffdff,
		24'hfcfefb,
		24'hf1f5dc,
		24'hd3aa74,
		24'h80614f,
		24'h6f5b5a,
		24'h866d57,
		24'h7c614e,
		24'h6f6661,
		24'h847f79,
		24'ha6917c,
		24'hba9c80,
		24'hbaa48f,
		24'hb9a493,
		24'hc1a590,
		24'hbea883,
		24'hc1a285,
		24'ha28877,
		24'h7b7269,
		24'h81746c,
		24'h9c7c6d,
		24'haa8572,
		24'h967e66,
		24'h86705b,
		24'h8b6b56,
		24'h9e7c63,
		24'ha68969,
		24'hd7ba9a,
		24'hba9a81,
		24'ha78c79,
		24'hcdc0af,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hffffff,
		24'hfffdff,
		24'hfffeff,
		24'hffffff,
		24'hfeffff,
		24'hfdfffc,
		24'hfefefc,
		24'hfffefc,
		24'hfffefd,
		24'hfafeff,
		24'hfafffb,
		24'hfefbf4,
		24'hd6c8bd,
		24'hc9af96,
		24'h9c7e66,
		24'h7f6554,
		24'h75644a,
		24'h766354,
		24'h6f5d51,
		24'h75665f,
		24'h827773,
		24'h857a78,
		24'h82736e,
		24'h85746c,
		24'h8e7a71,
		24'h927f78,
		24'h86786f,
		24'h726960,
		24'h716b5f,
		24'h857e6e,
		24'h948371,
		24'h937b63,
		24'h94745b,
		24'h8f755c,
		24'hb48662,
		24'hab8264,
		24'hb59c86,
		24'hc9af94,
		24'hb99c7e,
		24'hb2977c,
		24'hc5a68a,
		24'he0d1be,
		24'hfffcf1,
		24'hfffeff,
		24'hf9fbff,
		24'hfcffff,
		24'hfffff8,
		24'hfffffa,
		24'hfffeff,
		24'hffffff,
		24'hffffff,
		24'hfffffb,
		24'hfffffd,
		24'hfefffd,
		24'hfcffff,
		24'hfafbfd,
		24'hfcfdff,
		24'hffffff,
		24'hfffeff,
		24'hfaf1ec,
		24'hf2e2c9,
		24'hd1ba9b,
		24'hbfa994,
		24'hc8ac96,
		24'hac8566,
		24'ha7805f,
		24'h937457,
		24'h79634b,
		24'h75634d,
		24'h7b6a58,
		24'h817464,
		24'h877a6a,
		24'h8c7f6c,
		24'h93836c,
		24'h95846a,
		24'h7e7361,
		24'h857969,
		24'h8b7d70,
		24'h938173,
		24'h988274,
		24'h957f6a,
		24'h957b64,
		24'h9a8065,
		24'hb19476,
		24'hc08f66,
		24'haf886b,
		24'hcec1b9,
		24'hbfb5a9,
		24'hac947a,
		24'hc5a78b,
		24'hc1a286,
		24'hbaa789,
		24'hf0e3db,
		24'hfffaff,
		24'hfeffff,
		24'hfbfffc,
		24'hfefffd,
		24'hfdfdff,
		24'hfeffff,
		24'hffffff,
		24'hffffff,
		24'hfefffd,
		24'hfdfffe,
		24'hfeffff,
		24'hfeffff,
		24'hffffff,
		24'hfffffb,
		24'hfffcf5,
		24'hf2eee5,
		24'hccbca2,
		24'hd3af8b,
		24'hcaa378,
		24'hc9b293,
		24'hc9b4a1,
		24'hbb967b,
		24'hbc8e6a,
		24'ha87d5b,
		24'h8e7356,
		24'h856b52,
		24'h7d674f,
		24'h827058,
		24'h928269,
		24'ha39477,
		24'ha89877,
		24'ha49170,
		24'ha38e79,
		24'h9f8d77,
		24'h9a8975,
		24'h978770,
		24'h97836b,
		24'h9c8068,
		24'hab876d,
		24'hbc947a,
		24'hc3a078,
		24'hc48e60,
		24'ha98167,
		24'hd3d1d4,
		24'hdee2e5,
		24'hbfb09d,
		24'hc3a88a,
		24'hc2a587,
		24'hb79d7a,
		24'hbba89a,
		24'hdbd2d5,
		24'hfefefe,
		24'hfefffb,
		24'hfcfefd,
		24'hfeffff,
		24'hfeffff,
		24'hffffff,
		24'hffffff,
		24'hfbffff,
		24'hfeffff,
		24'hffffff,
		24'hfcf8f5,
		24'hf3ece2,
		24'headfcd,
		24'hdaccb2,
		24'hc9ba9b,
		24'hc4b492,
		24'hc9a58b,
		24'hd5b18f,
		24'hc2b392,
		24'hc7c1b5,
		24'hd3bfb4,
		24'hbb9777,
		24'hc49871,
		24'hae8c70,
		24'h9c7d61,
		24'h8a6e56,
		24'h856a55,
		24'h8a715b,
		24'h927c65,
		24'h9b856d,
		24'h9f8a6f,
		24'ha1856f,
		24'h998169,
		24'h947f64,
		24'h988567,
		24'ha28b6b,
		24'hb29170,
		24'hc69b79,
		24'hd4a480,
		24'hd1a777,
		24'hd29e6f,
		24'haa8165,
		24'h9f9593,
		24'hd6dadd,
		24'hdfd5c9,
		24'hbca488,
		24'hbfa282,
		24'hceac91,
		24'hbfa78d,
		24'hada08f,
		24'he4dfdc,
		24'hfefcff,
		24'hfffffd,
		24'hfefffd,
		24'hfbffff,
		24'hffffff,
		24'hffffff,
		24'hfdfef8,
		24'hfefdf8,
		24'hf2ebe3,
		24'hdfd3c7,
		24'hd6c3b2,
		24'hcfb79d,
		24'hc7ad8c,
		24'hc6aa85,
		24'hc9b499,
		24'hd0b49f,
		24'hd2b89f,
		24'hbfb4a0,
		24'hdcdedb,
		24'he0dcd1,
		24'ha68e6c,
		24'hca9d73,
		24'hcaa47f,
		24'hbe9a78,
		24'hb39072,
		24'had8b72,
		24'ha78971,
		24'ha48570,
		24'ha28670,
		24'ha58973,
		24'ha48a71,
		24'ha78c71,
		24'haf9074,
		24'hbb9777,
		24'hc59d79,
		24'hd1a77d,
		24'hd9ae81,
		24'hdcb280,
		24'he1b27e,
		24'hd2a377,
		24'hae8162,
		24'h7e614f,
		24'hada29c,
		24'hebe4da,
		24'hc1af97,
		24'hc8ab89,
		24'hd5b09e,
		24'hd1b698,
		24'haf9f7e,
		24'h928678,
		24'heee5e6,
		24'hfffcfe,
		24'hfcfcfa,
		24'hfafffb,
		24'hffffff,
		24'hfefefe,
		24'hcec8b2,
		24'hd4ccb5,
		24'hd1c2ab,
		24'hccb69f,
		24'hcfb39d,
		24'hcdad94,
		24'hcaa68c,
		24'hcda98f,
		24'hceb29d,
		24'hd8bda0,
		24'hccb79c,
		24'hd5cbc2,
		24'heceaeb,
		24'hccc7b1,
		24'ha68b60,
		24'hce9971,
		24'hdcb483,
		24'hd5af80,
		24'hcda67b,
		24'hc7a17c,
		24'hc6a280,
		24'hc9a686,
		24'hcca98b,
		24'hcfac8e,
		24'hcaa68c,
		24'hc8a589,
		24'hc9a583,
		24'hcea883,
		24'hdbb187,
		24'he7bb8c,
		24'hebbd8b,
		24'he7b882,
		24'hddab78,
		24'hc89b72,
		24'hb1815d,
		24'h906749,
		24'ha89688,
		24'heae6db,
		24'hc4b5a0,
		24'hcbae8e,
		24'hd2b29d,
		24'hccb098,
		24'hc2ad8e,
		24'hb5a488,
		24'hb3a396,
		24'hf2e6ea,
		24'hfffeff,
		24'hfefff6,
		24'hffffff,
		24'hffffff,
		24'haa9880,
		24'hbca88f,
		24'hcab296,
		24'hcfb497,
		24'hd2b498,
		24'hceb096,
		24'hcfb199,
		24'hd9baa5,
		24'hd3b79f,
		24'hcdb08e,
		24'hc2ac95,
		24'he8e0dd,
		24'he2e2da,
		24'hab9d82,
		24'haa8761,
		24'hc7936b,
		24'hd7ad7b,
		24'hdcb282,
		24'hddb285,
		24'hd9b084,
		24'hd9af85,
		24'hd8b186,
		24'hdbb48b,
		24'hdfb88f,
		24'he0b392,
		24'hdeb390,
		24'hdab58b,
		24'hdcba8d,
		24'he8c494,
		24'hf0c694,
		24'heebc8b,
		24'he4ae7f,
		24'hd6a676,
		24'hd2a57c,
		24'hbc8b63,
		24'h9f7859,
		24'hc1b8a9,
		24'he7e5d9,
		24'hc1af97,
		24'hc4a68a,
		24'hc8ae97,
		24'hc6ab98,
		24'hcab29a,
		24'hc7ae90,
		24'hc1a98f,
		24'hbaa89c,
		24'hece4e1,
		24'hfcfdf8,
		24'hfdfdfd,
		24'hffffff,
		24'ha88a7f,
		24'hb9998a,
		24'hcbad95,
		24'hdabd9f,
		24'hddc3a2,
		24'hd9c0a1,
		24'hd6c1a4,
		24'hdbc7ac,
		24'hd7c5a1,
		24'hcaad8f,
		24'hc6b0a5,
		24'heaebe6,
		24'hd5d9c8,
		24'h9a8371,
		24'haa7d68,
		24'hcc9f76,
		24'hd8ad83,
		24'hdaaf85,
		24'hddb087,
		24'he3b68c,
		24'he8bb91,
		24'he5ba8f,
		24'he0b588,
		24'hdeb587,
		24'he1ba8f,
		24'he9c094,
		24'hecc194,
		24'hefc094,
		24'hf0c092,
		24'hedbe90,
		24'he7b88a,
		24'he1b586,
		24'hdeaf83,
		24'hd6a77d,
		24'hc4936a,
		24'ha7896d,
		24'he7e7df,
		24'he4e2d6,
		24'hc5af97,
		24'hd6b89e,
		24'hcdb7a2,
		24'hc4ae97,
		24'hbca18c,
		24'hd9baa5,
		24'hd5b89a,
		24'hc4b191,
		24'h958d80,
		24'hb2b0bb,
		24'hfafafa,
		24'hffffff,
		24'hb2a497,
		24'hc9ae90,
		24'hc2a585,
		24'hd1b9a1,
		24'hdbc1a8,
		24'hdfcbb0,
		24'hd4c3a7,
		24'hdbbc9f,
		24'hd5ba9d,
		24'hc2a897,
		24'hd2c9c4,
		24'hedefec,
		24'hd4c8ba,
		24'hb38a6a,
		24'hb8875e,
		24'hc49d74,
		24'hd7b182,
		24'he2b78a,
		24'he8b98d,
		24'heab98e,
		24'hecbb90,
		24'hedbe92,
		24'hedc295,
		24'hf0ca9b,
		24'hf4c79d,
		24'hf3c498,
		24'heebf91,
		24'hebbc8e,
		24'heebf91,
		24'heec293,
		24'hecc091,
		24'he6bb8e,
		24'he1b588,
		24'hdba87b,
		24'hc99772,
		24'hccc2b9,
		24'hf4f1ea,
		24'hdedccf,
		24'hcab296,
		24'hcfb59e,
		24'hd0b69b,
		24'hc6ac93,
		24'hc1a991,
		24'hcdb39a,
		24'hdbc3a9,
		24'hccbba7,
		24'h716863,
		24'h35343c,
		24'h7e787a,
		24'hf4f4f4,
		24'hc8baad,
		24'hd5ba9c,
		24'hcbae8e,
		24'hcdb59d,
		24'hddc3aa,
		24'hdbc7ac,
		24'hd8c7ab,
		24'hdcbda0,
		24'hd1b699,
		24'hc1b59f,
		24'hd6d9d0,
		24'hf2f4f1,
		24'hddd1c3,
		24'hc1a580,
		24'hc29d70,
		24'hc6a177,
		24'hd8ae88,
		24'he4bd96,
		24'heac49d,
		24'he6c39b,
		24'he8c59d,
		24'heec8a1,
		24'heec7a0,
		24'hefc59f,
		24'heec7a0,
		24'hedc69f,
		24'hf0c69e,
		24'hf4caa0,
		24'hf6cca2,
		24'hefc89d,
		24'he9c49a,
		24'he7c298,
		24'he5b891,
		24'hd7ac82,
		24'hd8b691,
		24'hf1f2ec,
		24'hf4f3f1,
		24'hdad5d1,
		24'hcab5a0,
		24'hccc0aa,
		24'hd2b89d,
		24'hceb49b,
		24'hd0b8a0,
		24'hd4bca2,
		24'hdbc3a9,
		24'hb5a490,
		24'h4d443f,
		24'h37363c,
		24'h4d4d4d,
		24'h837d7f
	};

	assign data = ROM[addr];

endmodule  
