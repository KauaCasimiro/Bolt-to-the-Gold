function scr_enemy_attack_type_3(){
    if (attack_cooldown <= 0) {
        if (point_distance(x, y, obj_player.x, obj_player.y) <= atk_distance) {
                obj_player.take_damage(x, y, obj_player.recoil_force * 2);
        }
        
        attack_cooldown = attack_cooldown_time;
        state = EnemyState.CHASE;
    }
    
    
}