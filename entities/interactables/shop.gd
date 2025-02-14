extends StaticBody2D


enum ShopType {
	BUY_SEEDS,
	SELL_CROPS,
}

@export var shop_type: ShopType


func interact():
	match shop_type:
		ShopType.BUY_SEEDS:
			GlobalSignals.start_shopping.emit(false)
		ShopType.SELL_CROPS:
			GlobalSignals.start_shopping.emit(true)
