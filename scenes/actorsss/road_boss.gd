extends NavEnemy

func hit(amt:int = 1):
	hp -= amt - 3
	if hp <= 0:
		queue_free()
