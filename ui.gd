extends Control
@onready var PriceLabel = $OrderPanel/VBoxContainer/Price
@onready var PayedLabel = $OrderPanel/VBoxContainer/Payed
@onready var ReturnLabel = $"OrderPanel/VBoxContainer/To Return"

@onready var TimeBar = $OrderPanel/VBoxContainer/TimeContainer/ProgressBar
@onready var ScoreLabel = $Score

var PriceList = [95, 125, 185, 230, 315 ]
var CoinValues = [200, 100, 50, 5]
var ToReturn : int
var score:int : set = set_score

func _ready() -> void:
	init_order()

func _process(delta: float) -> void:
	updateTimer(delta)

func updateTimer(plusTime: float) -> void:
	var newval = TimeBar.value + plusTime *3
	if newval > 100 :
		score = score - 300
		newval = 0
		init_order()
		
	TimeBar.value = newval

func checkValue(coinval : int) -> bool :
	return (coinval <= ToReturn)

func removeValue(coinval : int) -> void :
	ToReturn -= coinval
	if ToReturn < 0 :
		score = score + ToReturn
		init_order()
		TimeBar.value = 0
	else :
		if ToReturn == 0:
			score = score + 200
			init_order()
			TimeBar.value = 0

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

func set_score(newval : int):
	score = newval
	if score >= 0 :
		ScoreLabel.text = "Your Salary :\n %d.%d%d" %[score/100, score%100/10, score%10]
	else :
		ScoreLabel.text = "Your Salary :\n -%d.%d%d" %[-score/100, -score%100/10, -score%10]
func _on_returner_returned_coin(retValue: int) -> void:
	removeValue(retValue)
