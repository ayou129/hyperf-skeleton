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
 * @property int $id
 * @property string $error
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * @property string $deleted_at
 */
class SysError extends BaseModel
{
    /**
     * The table associated with the model.
     */
    protected ?string $table = 'sys_error';

    /**
     * The attributes that are mass assignable.
     */
    protected array $fillable = ['id', 'error', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * The attributes that should be cast to native types.
     */
    protected array $casts = ['id' => 'integer', 'created_at' => 'datetime', 'updated_at' => 'datetime'];
}
