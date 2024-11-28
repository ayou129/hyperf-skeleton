<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */

namespace App\Model;

use Carbon\Carbon;

/**
 * @property int $group_id
 * @property int $menu_id
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * @property string $deleted_at
 */
class AdminGroupMenusRelation extends BaseModel
{
    public bool $incrementing = false;

    protected string $primaryKey = 'group_id';

    /**
     * The table associated with the model.
     */
    protected ?string $table = 'admin_group_menus_relation';

    /**
     * The attributes that are mass assignable.
     */
    protected array $fillable = ['group_id', 'menu_id', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * The attributes that should be cast to native types.
     */
    protected array $casts = ['group_id' => 'integer', 'menu_id' => 'integer', 'created_at' => 'datetime', 'updated_at' => 'datetime'];
}