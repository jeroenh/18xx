# frozen_string_literal: true

module Engine
  module Game
    module G1866
      module Entities
        COMPANIES = [
          {
            name: 'Stockton & Darlington',
            sym: 'P1',
            value: 0,
            revenue: 0,
            desc: 'Gives priority in ISR. Closes at end of IAR when ISR priority determined.',
            abilities: [],
            color: nil,
          },
          {
            name: 'Great Britain',
            sym: 'P2',
            value: 0,
            revenue: 10,
            desc: 'Concession for Great Britain National Company. Closes when concession exercised to purchase '\
                  'company.',
            abilities: [
              {
                type: 'exchange',
                corporations: ['GBN'],
                owner_type: 'player',
                from: 'par',
              },
            ],
            color: nil,
          },
          {
            name: 'France',
            sym: 'P3',
            value: 0,
            revenue: 10,
            desc: 'Concession for France National Company. Closes when concession exercised to purchase company.',
            abilities: [
              {
                type: 'exchange',
                corporations: ['FN'],
                owner_type: 'player',
                from: 'par',
              },
            ],
            color: nil,
          },
          {
            name: 'Austro-Hungarian Empire',
            sym: 'P4',
            value: 0,
            revenue: 10,
            desc: 'Concession for Austro-Hungarian Empire National Company. Closes when concession exercised to '\
                  'purchase company.',
            abilities: [
              {
                type: 'exchange',
                corporations: ['AHN'],
                owner_type: 'player',
                from: 'par',
              },
            ],
            color: nil,
          },
          {
            name: 'Benelux',
            sym: 'P5',
            value: 0,
            revenue: 10,
            desc: 'Concession for Benelux National Company. Closes when concession exercised to purchase company.',
            abilities: [
              {
                type: 'exchange',
                corporations: ['BN'],
                owner_type: 'player',
                from: 'par',
              },
            ],
            color: nil,
          },
          {
            name: 'Spain',
            sym: 'P6',
            value: 0,
            revenue: 10,
            desc: 'Concession for Spain National Company. Closes when concession exercised to purchase company.',
            abilities: [
              {
                type: 'exchange',
                corporations: ['SPN'],
                owner_type: 'player',
                from: 'par',
              },
            ],
            color: nil,
          },
          {
            name: 'Switzerland',
            sym: 'P7',
            value: 0,
            revenue: 10,
            desc: 'Concession for Switzerland National Company. Closes when concession exercised to purchase company.',
            abilities: [
              {
                type: 'exchange',
                corporations: ['SWN'],
                owner_type: 'player',
                from: 'par',
              },
            ],
            color: nil,
          },
          {
            name: 'Income Bond',
            sym: 'P8',
            value: 0,
            revenue: 10,
            desc: 'Pays phase based income 10/20/30/40.',
            abilities: [],
            color: nil,
          },
          {
            name: 'Stock turn token',
            sym: 'ST1',
            value: 0,
            revenue: 0,
            desc: 'Give the player the ability to purchase Stock turn tokens during ISR and as a Stock turn token '\
                  'action.',
            abilities: [],
            color: nil,
          },
          {
            name: 'Stock turn token',
            sym: 'ST2',
            value: 0,
            revenue: 0,
            desc: 'Give the player the ability to purchase Stock turn tokens during ISR and as a Stock turn token '\
                  'action.',
            abilities: [],
            color: nil,
          },
          {
            name: 'Stock turn token',
            sym: 'ST3',
            value: 0,
            revenue: 0,
            desc: 'Give the player the ability to purchase Stock turn tokens during ISR and as a Stock turn token '\
                  'action.',
            abilities: [],
            color: nil,
          },
          {
            name: 'Stock turn token',
            sym: 'ST4',
            value: 0,
            revenue: 0,
            desc: 'Give the player the ability to purchase Stock turn tokens during ISR and as a Stock turn token '\
                  'action.',
            abilities: [],
            color: nil,
          },
          {
            name: 'Stock turn token',
            sym: 'ST5',
            value: 0,
            revenue: 0,
            desc: 'Give the player the ability to purchase Stock turn tokens during ISR and as a Stock turn token '\
                  'action.',
            abilities: [],
            color: nil,
          },
          {
            name: 'Stock turn token',
            sym: 'ST6',
            value: 0,
            revenue: 0,
            desc: 'Give the player the ability to purchase Stock turn tokens during ISR and as a Stock turn token '\
                  'action.',
            abilities: [],
            color: nil,
          },
          {
            name: 'Stock turn token',
            sym: 'ST7',
            value: 0,
            revenue: 0,
            desc: 'Give the player the ability to purchase Stock turn tokens during ISR and as a Stock turn token '\
                  'action.',
            abilities: [],
            color: nil,
          },
        ].freeze

        CORPORATIONS = [
          {
            sym: 'GBN',
            name: 'Great Britain National',
            logo: '1866/GBN',
            tokens: [],
            type: 'national',
            float_percent: 20,
            shares: [20, 20, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[F6 F6 F6 A3 D6 G3 E1 E3 G1 D2 F2 D4],
            city: [0, 1, 2],
            color: '#fde2c5',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'FN',
            name: 'France National',
            logo: '1866/FN',
            tokens: [],
            type: 'national',
            float_percent: 20,
            shares: [20, 20, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[J6 J6 J6 H8 I9 J10 K9 M9 O5 I1 I5 K1 K3 K13 N2 O7 P12 P10],
            city: [0, 1, 2],
            color: '#fffbcc',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'AHN',
            name: 'Austro-Hungary National',
            logo: '1866/AHN',
            tokens: [],
            type: 'national',
            float_percent: 20,
            shares: [20, 20, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[K25 L18 N22 O23 O21 J22 L24 M23 Q25],
            color: '#e2ceb6',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'GN',
            name: 'Germany National',
            logo: '1866/GN',
            tokens: [],
            type: 'national',
            float_percent: 20,
            shares: [20, 20, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[H14 F22 E25 E19 F18 E17 K19 I15 K15 I23 H20],
            color: '#d0c1de',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'IN',
            name: 'Italy National',
            logo: '1866/IN',
            tokens: [],
            type: 'national',
            float_percent: 20,
            shares: [20, 20, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[S23 T20 V18 V20 N12 O13 T12 N14 P18 N18 R18 Q19 Q17],
            color: '#ff7ffe',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'BN',
            name: 'Benelux National',
            logo: '1866/BN',
            tokens: [],
            type: 'national',
            float_percent: 20,
            shares: [20, 20, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[F10 F12 G9 G11 H10 H12 I11],
            color: '#7eff80',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'SPN',
            name: 'Spain National',
            logo: '1866/SPN',
            tokens: [],
            type: 'national',
            float_percent: 20,
            shares: [20, 20, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[O1 T2 R4 U1],
            color: '#bea481',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'SWN',
            name: 'Switzerland National',
            logo: '1866/SWN',
            tokens: [],
            type: 'national',
            float_percent: 20,
            shares: [20, 20, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[L14 L16 L12],
            color: '#d6cf81',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'G1',
            name: 'Prussia Minor National',
            logo: '1866/G1',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: %w[H14 F22 E25],
            color: '#d0c1de',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'G2',
            name: 'Hannover Minor National',
            logo: '1866/G2',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: %w[E19 F18 E17],
            color: '#a764a9',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'G3',
            name: 'Bavaria Minor National',
            logo: '1866/G3',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: 'K19',
            color: '#8781bf',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'G4',
            name: 'Wurttemburg Minor National',
            logo: '1866/G4',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: %w[I15 K15],
            color: '#855fa8',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'G5',
            name: 'Saxony Minor National',
            logo: '1866/G5',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: %w[I23 H20],
            color: '#bd8dbf',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'I1',
            name: 'Kgdm 2 Sicilies Minor National',
            logo: '1866/I1',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: %w[S23 T20 V18 V20],
            color: '#ffcfe5',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'I2',
            name: 'Sardinia Minor National',
            logo: '1866/I2',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: %w[N12 O13 T12],
            color: '#f41097',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'I3',
            name: 'Lom-Venetia Minor National',
            logo: '1866/I3',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: %w[N14 P18 N18],
            color: '#ff7ffe',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'I4',
            name: 'Papal States Minor National',
            logo: '1866/I4',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: %w[R18 Q19],
            color: '#f26eaa',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'I5',
            name: 'Tuscany Minor National',
            logo: '1866/I5',
            tokens: [],
            type: 'minor',
            float_percent: 100,
            max_ownership_percent: 100,
            hide_shares: true,
            shares: [100],
            always_market_price: true,
            coordinates: 'Q17',
            color: '#f996c3',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'LNWR',
            name: 'London and North Western Railway',
            logo: '1866/LNWR',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'D4',
            color: '#0072bc',
            text_color: 'white',
            reservation_color: nil,
          },
          {
            sym: 'GWR',
            name: 'Great Western Railway',
            logo: '1866/GWR',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'F2',
            color: '#007236',
            text_color: 'white',
            reservation_color: nil,
          },
          {
            sym: 'NBR',
            name: 'North British Railway',
            logo: '1866/NBR',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'A3',
            color: '#7d4900',
            text_color: 'white',
            reservation_color: nil,
          },
          {
            sym: 'PLM',
            name: 'Chemins de fer de Paris à Lyon et à la Méditerranée',
            logo: '1866/PLM',
            tokens: [0, 0, 20, 40, 60, 80],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: %w[M9 P10],
            color: '#630460',
            text_color: 'white',
            reservation_color: nil,
          },
          {
            sym: 'MIDI',
            name: 'Chemin de Fer du Midi',
            logo: '1866/MIDI',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'N2',
            color: '#acd473',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'OU',
            name: 'Compagnie des chemins de fer del`Ouest',
            logo: '1866/OU',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'I5',
            color: '#fbaf5d',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'KPS',
            name: 'Königlich Preußische Staatseisenbahnen',
            logo: '1866/KPS',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'F22',
            color: '#000000',
            text_color: 'white',
            reservation_color: nil,
          },
          {
            sym: 'BY',
            name: 'Bayrische Staatsbahn',
            logo: '1866/BY',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'K19',
            color: '#6dd0f7',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'KHS',
            name: 'Königlich Hannöversche Staatseisenbahnen',
            logo: '1866/KHS',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'F18',
            color: '#fff200',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'SB',
            name: 'Sudbahn',
            logo: '1866/SB',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'N22',
            color: '#f26522',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'BH',
            name: 'Bosnia-Herzegowinische Landesbahn',
            logo: '1866/BH',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'Q25',
            color: '#ff0000',
            text_color: 'white',
            reservation_color: nil,
          },
          {
            sym: 'FNR',
            name: 'Emperor Ferdinand Northern Railway',
            logo: '1866/FNR',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'L24',
            color: '#a3d49c',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'SSFL',
            name: 'Societa per la Strada Ferrata Leopolda',
            logo: '1866/SSFL',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'Q17',
            color: '#48e293',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'IFT',
            name: 'Impresa Ferroviaria Trinacria',
            logo: '1866/IFT',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'V20',
            color: '#ff7ffe',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'SFAI',
            name: 'Società per le strade ferrate dell`Alta Italia',
            logo: '1866/SFAI',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'N14',
            color: '#a4610a',
            text_color: 'white',
            reservation_color: nil,
          },
          {
            sym: 'SBB',
            name: 'Chemins de fer fédéraux suisses',
            logo: '1866/SBB',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'L16',
            color: '#9e0b0f',
            text_color: 'white',
            reservation_color: nil,
          },
          {
            sym: 'ZPB',
            name: 'Zaragoza, Pamplona & Barcelona Railway',
            logo: '1866/ZPB',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'R4',
            color: '#ffc592',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'GL',
            name: 'Chemins de Fer Guillaume Luxembourg',
            logo: '1866/GL',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'I11',
            color: '#ffcd03',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'NRS',
            name: 'Nederlandsche Rhijnspoorweg-Maatschappij',
            logo: '1866/NRS',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'F12',
            color: '#d54427',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'MZA',
            name: 'Madrid, Zaragoza & Alicante Railway',
            logo: '1866/MZA',
            tokens: [0, 20, 40, 60, 80, 100],
            type: 'public_5',
            float_percent: 40,
            shares: [40, 20, 20, 20],
            always_market_price: true,
            coordinates: 'U1',
            color: '#fff191',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            sym: 'R',
            name: 'Red reservation',
            tokens: [],
            coordinates: %w[H26 L26 N26 P26 R0],
            reservation_color: '#e20000',
          },
        ].freeze
      end
    end
  end
end
