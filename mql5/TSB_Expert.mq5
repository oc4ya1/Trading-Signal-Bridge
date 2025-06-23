//+------------------------------------------------------------------+
//|                                                   Expert.mq5 |
//|                                  Copyright 2024, Trading Signal Bridge |
//|                                             https://github.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Trading Signal Bridge"
#property link      "https://github.com/"
#property version   "1.00"
#property strict

// Включаем библиотеку для работы с DLL
#import "TradingBridge.dll"
   bool Buy(string symbol, double volume, double price, double sl, double tp);
   bool Sell(string symbol, double volume, double price, double sl, double tp);
   bool CloseOrder(ulong ticket);
#import

// Входные параметры
input double LotSize = 0.1;           // Размер лота
input int StopLoss = 100;             // Стоп-лосс в пунктах
input int TakeProfit = 200;           // Тейк-профит в пунктах
input bool EnableTrading = true;      // Разрешить торговлю

// Глобальные переменные
int magicNumber = 12345;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
   Print("Trading Signal Bridge Expert initialized");
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   Print("Trading Signal Bridge Expert deinitialized");
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   // Основная логика будет добавлена позже
   // Здесь будет обработка сигналов от C# анализатора
}

//+------------------------------------------------------------------+
//| Функция для открытия ордера на покупку                          |
//+------------------------------------------------------------------+
bool OpenBuyOrder(string symbol, double volume, double price, double sl, double tp)
{
   if(!EnableTrading) return false;
   
   MqlTradeRequest request = {};
   MqlTradeResult result = {};
   
   request.action = TRADE_ACTION_DEAL;
   request.symbol = symbol;
   request.volume = volume;
   request.type = ORDER_TYPE_BUY;
   request.price = price;
   request.sl = sl;
   request.tp = tp;
   request.deviation = 10;
   request.magic = magicNumber;
   request.comment = "Trading Bridge Buy";
   request.type_filling = ORDER_FILLING_FOK;
   
   return OrderSend(request, result);
}

//+------------------------------------------------------------------+
//| Функция для открытия ордера на продажу                          |
//+------------------------------------------------------------------+
bool OpenSellOrder(string symbol, double volume, double price, double sl, double tp)
{
   if(!EnableTrading) return false;
   
   MqlTradeRequest request = {};
   MqlTradeResult result = {};
   
   request.action = TRADE_ACTION_DEAL;
   request.symbol = symbol;
   request.volume = volume;
   request.type = ORDER_TYPE_SELL;
   request.price = price;
   request.sl = sl;
   request.tp = tp;
   request.deviation = 10;
   request.magic = magicNumber;
   request.comment = "Trading Bridge Sell";
   request.type_filling = ORDER_FILLING_FOK;
   
   return OrderSend(request, result);
}

//+------------------------------------------------------------------+
//| Функция для закрытия ордера                                     |
//+------------------------------------------------------------------+
bool CloseOrder(ulong ticket)
{
   MqlTradeRequest request = {};
   MqlTradeResult result = {};
   
   request.action = TRADE_ACTION_DEAL;
   request.order = ticket;
   request.deviation = 10;
   
   return OrderSend(request, result);
} 