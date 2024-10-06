extends Control
@onready var PriceLabel = $OrderPanel/VBoxContainer/Price
@onready var PayedLabel = $OrderPanel/VBoxContainer/Payed
@onready var ReturnLabel = $"OrderPanel/VBoxContainer/To Return"
var PriceList = [95, 125, 185, 230, 315 ]
var CoinValues = [200, 100, 50, 20, 5]
var ToReturn : int

func _ready() -> void:
	init_order()

func checkValue(coinval : int) -> bool :
	return (coinval <= ToReturn)

func removeValue(coinval : int) -> void :
	ToReturn -= coinval
	ReturnLabel.text = "To Return : %d.%d%d" %[ToReturn/100, ToReturn %100/10, ToReturn%10]


func init_order():
	var NbItems = randi() %5
	var TargetPrice = 0
	for i in range(NbItems):
		TargetPrice += PriceList[randi()%(PriceList.size())]
	var PaidPrice = 0
	while(PaidPrice < TargetPrice):
		PaidPrice += CoinValues[randi()%(CoinValues.size())]
	ToReturn = PaidPrice - TargetPrice
	
		
	PriceLabel.text = "Price : %d.%d%d" %[TargetPrice/100, TargetPrice%100/10, TargetPrice%10]
	PayedLabel.text = "Payed : %d.%d%d" %[PaidPrice/100, PaidPrice%100/10, PaidPrice%10]
	ReturnLabel.text = "To Return : %d.%d%d" %[ToReturn/100, ToReturn %100/10, ToReturn%10]
	
	if ToReturn == 0 :
		init_order()
