# frozen_string_literal: true

require_relative 'meta'
require_relative 'map'
require_relative '../base'

module Engine
  module Game
    module G1848
      class Game < Game::Base
        attr_reader :sydney_adelaide_connected

        include_meta(G1848::Meta)
        include Map

        CURRENCY_FORMAT_STR = '£%d'

        BANK_CASH = 10_000

        CERT_LIMIT = { 3 => 20, 4 => 17, 5 => 14, 6 => 12 }.freeze

        STARTING_CASH = { 3 => 840, 4 => 630, 5 => 510, 6 => 430 }.freeze

        CAPITALIZATION = :full

        MUST_SELL_IN_BLOCKS = false

        MARKET = [
          %w[0c
             70
             80
             90
             100
             110
             120
             140
             160
             190
             220
             250
             280
             320
             360
             400
             450e],
          %w[0c
             60
             70
             80
             90
             100p
             110
             130
             150
             180
             210
             240
             270
             310
             350
             390
             440],
          %w[0c
             50
             60
             70
             80
             90p
             100
             120
             140
             170
             200
             230
             260
             300],
          %w[0c 40 50 60 70 80p 90 110 130 160 190],
          %w[0c 30 40 50 60 70p 80 100 120],
          %w[0c 20 30 40 50 60 70],
        ].freeze

        PHASES = [{ name: '2', train_limit: 4, tiles: [:yellow], operating_rounds: 1 },
                  {
                    name: '3',
                    on: '3',
                    train_limit: 4,
                    tiles: %i[yellow green],
                    operating_rounds: 2,
                    status: ['can_buy_companies'],
                  },
                  {
                    name: '4',
                    on: '4',
                    train_limit: 3,
                    tiles: %i[yellow green],
                    operating_rounds: 2,
                    status: ['can_buy_companies'],
                  },
                  {
                    name: '5',
                    on: '5',
                    train_limit: 2,
                    tiles: %i[yellow green brown],
                    operating_rounds: 3,
                  },
                  {
                    name: '6',
                    on: '6',
                    train_limit: 2,
                    tiles: %i[yellow green brown],
                    operating_rounds: 3,
                  },
                  {
                    name: '8',
                    on: '8',
                    train_limit: 2,
                    tiles: %i[yellow green brown gray],
                    operating_rounds: 3,
                  }].freeze

        TRAINS = [
          {
            name: '2',
            distance: 2,
            price: 100,
            rusts_on: '4',
            num: 6,
            variants: [
              { name: '2+', price: 120 },
            ],
          },
          {
            name: '3',
            distance: 3,
            price: 200,
            rusts_on: '6',
            num: 5,
            variants: [
              { name: '3+', distance: 3, price: 230 },
            ],
          },
          {
            name: '4',
            distance: 4,
            price: 300,
            rusts_on: '8',
            num: 4,
            variants: [
              { name: '4+', distance: 4, price: 340 },
            ],
          },
          {
            name: '5',
            distance: 5,
            price: 500,
            num: 3,
            events: [{ 'type' => 'close_companies' }],
            variants: [
              { name: '5+', distance: 5, price: 550 },
],
          },
          {
            name: '6',
            distance: 6,
            price: 600,
            num: 2,
            variants: [
              { name: '6+', distance: 6, price: 660 },
            ],
          },
          {
            name: 'D',
            distance: 999,
            price: 1100,
            num: 6,
            discount: { '4' => 300, '5' => 300, '6' => 300 },
          },
          {
            name: '8',
            distance: 8,
            price: 800,
            num: 6,
          },
          {
            name: '2E',
            distance: 2,
            price: 200,
            num: 6,
            available_on: '5',
          },
        ].freeze

        COMPANIES = [
          {
            sym: 'P1',
            name: "Melbourne & Hobson's Bay Railway Company",
            value: 40,
            discount: 10,
            revenue: 5,
            desc: 'No special abilities.',
          },
          {
            sym: 'P2',
            name: 'Sydney Railway Company',
            value: 80,
            discount: 10,
            revenue: 10,
            desc: 'Owning Public Company or its Director may build one (1) free tile on a desert hex (marked by'\
                  ' a cactus icon). This power does not go away after a 5/5+ train is purchased.',
            abilities: [
              {
                type: 'tile_discount',
                discount: 40,
                terrain: 'desert',
                count: 1,
                owner_type: 'corporation',
              },
              {
                type: 'tile_discount',
                discount: 40,
                terrain: 'desert',
                count: 1,
                owner_type: 'player',
              },
            ],
          },
          {
            sym: 'P3',
            name: 'Tasmanian Railways',
            value: 140,
            discount: 30,
            revenue: 15,
            desc: 'The Tasmania tile can be placed by a Public Company on one of the dark blue hexes. This is in'\
                  " addition to the company's normal build that turn.",
          },
          {
            sym: 'P4',
            name: 'The Ghan',
            value: 220,
            discount: 50,
            revenue: 20,
            desc: 'Owning Public Company or its Director may receive a one-time discount of £100 on the purchase'\
                  ' of a 2E (Ghan) train. This power does not go away after a 5/5+ train is purchased.',
          },
          {
            sym: 'P5',
            name: 'Trans-Australian Railway',
            value: 0,
            discount: -170,
            revenue: 25,
            desc: 'The owner receives a 10% share in the QR. Cannot be bought by a corporation',
          },
          {
            sym: 'P6',
            name: 'North Australian Railway',
            value: 0,
            discount: -230,
            revenue: 30,
            desc: "The owner receives a Director's Share share in the CAR, which must start at a par value of £100."\
                  ' Cannot be bought by a corporation',
          },
        ].freeze

        CORPORATIONS = [
          {
            sym: 'BOE',
            name: 'Bank of England',
            logo: '1848/BOE',
            simple_logo: '1848/BOE.alt',
            tokens: [],
            text_color: 'black',
            color: 'antiqueWhite',
          },
          {
            sym: 'CAR',
            name: 'Central Australian Railway',
            logo: '1848/CAR',
            simple_logo: '1848/CAR.alt',
            tokens: [0, 40, 100],
            coordinates: 'E4',
            color: '#232b2b',
          },
          {
            sym: 'VR',
            name: 'Victorian Railways',
            logo: '1848/VR',
            simple_logo: '1848/VR.alt',
            tokens: [0, 40, 100],
            coordinates: 'H11',
            text_color: 'black',
            color: 'gold',
          },
          {
            sym: 'NSW',
            name: 'New South Wales Railways',
            logo: '1848/NSW',
            simple_logo: '1848/NSW.alt',
            tokens: [0, 40, 100, 100],
            coordinates: 'F17',
            text_color: 'black',
            color: 'orange',
          },
          {
            sym: 'SAR',
            name: 'South Australian Railway',
            logo: '1848/SAR',
            simple_logo: '1848/SAR.alt',
            tokens: [0, 40, 100, 100],
            coordinates: 'G6',
            color: 'darkMagenta',
          },
          {
            sym: 'COM',
            name: 'Commonwealth Railways',
            logo: '1848/COM',
            simple_logo: '1848/COM.alt',
            tokens: [0, 0, 100, 100, 100],
            color: 'dimGray',
          },
          {
            sym: 'FT',
            name: 'Federal Territory Railway',
            logo: '1848/FT',
            simple_logo: '1848/FT.alt',
            tokens: [0, 40, 100, 100],
            coordinates: 'G14',
            color: 'mediumBlue',
          },
          {
            sym: 'WA',
            name: 'West Australian Railway',
            logo: '1848/WA',
            simple_logo: '1848/WA.alt',
            tokens: [0, 40, 100, 100, 100],
            coordinates: 'D1',
            color: 'maroon',
          },
          {
            sym: 'QR',
            name: "Queensland Gov't Railway",
            logo: '1848/QR',
            simple_logo: '1848/QR.alt',
            tokens: [0, 40, 100, 100, 100],
            coordinates: 'B19',
            color: 'darkGreen',
          },
        ].freeze

        # Two tiles can be laid at a time, with max one upgrade
        TILE_LAYS = [{ lay: true, upgrade: true }, { lay: true, upgrade: :not_if_upgraded }].freeze

        SELL_BUY_ORDER = :sell_buy
        SELL_MOVEMENT = :down_block

        HOME_TOKEN_TIMING = :operate

        def setup
          super
          @sydney_adelaide_connected = false
        end

        def new_auction_round
          Engine::Round::Auction.new(self, [
            G1848::Step::DutchAuction,
          ])
        end

        def operating_round(round_num)
          Round::Operating.new(self, [
            Engine::Step::Bankrupt,
            Engine::Step::Exchange,
            Engine::Step::BuyCompany,
            G1848::Step::Track,
            Engine::Step::Token,
            Engine::Step::Route,
            Engine::Step::Dividend,
            Engine::Step::DiscardTrain,
            G1848::Step::BuyTrain,
            [Engine::Step::BuyCompany, { blocks: true }],
          ], round_num: round_num)
        end

        def upgrades_to?(from, to, _special = false, selected_company: nil)
          return %w[5 6 57].include?(to.name) if (from.hex.tile.label.to_s == 'K') && (from.hex.tile.color == 'white')

          super
        end

        def sar
          # SAR is used for graph to find adelaide (to connect to sydney for starting COM)
          @sar ||= @corporations.find { |corporation| corporation.name == 'SAR' }
        end

        def sydney
          @sydney ||= hex_by_id('F17')
        end

        def adelaide
          @adelaide ||= hex_by_id('G6')
        end

        def check_sydney_adelaide_connected
          return @sydney_adelaide_connected if @sydney_adelaide_connected

          graph = Graph.new(self, home_as_token: true, no_blocking: true)
          graph.compute(sar)
          @sydney_adelaide_connected = graph.reachable_hexes(sar).include?(sydney)
          @sydney_adelaide_connected
        end

        def place_home_token(entity)
          return super if entity.name != :COM
          return unless @sydney_adelaide_connected
          return if entity.tokens.first&.used

          # COM places home tokens... regardless as to whether there is space for them
          [sydney, adelaide].each do |home_hex|
            city = home_hex.tile.cities[0]
            slot = city.available_slots.positive? ? 0 : city.slots
            home_token = entity.tokens.find { |token| !token.used && token.price.zero? }
            city.place_token(entity, home_token, free: true, check_tokenable: false, cheater: slot)
          end
        end

        def crowded_corps
          # 2E does not create a crowded corp
          @crowded_corps ||= (minors + corporations).select do |c|
            c.trains.count { |t| !t.obsolete && t.name != '2E' } > train_limit(c)
          end
        end

        def must_buy_train?(entity)
          # 2E does not count as compulsory train purchase
          entity.trains.reject { |t| t.name == '2E' }.empty? &&
            !depot.depot_trains.empty? &&
             (self.class::MUST_BUY_TRAIN == :route && @graph.route_info(entity)&.dig(:route_train_purchase))
        end
      end
    end
  end
end
