<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Product extends Model implements HasMedia
{
    use InteractsWithMedia, HasFactory;

    protected $casts = ['publish_at' => 'datetime'];

    protected $guarded = [];

    /**
     * Format the product published date.
     */
    public function getPublishedDateAttribute()
    {
        if (! $this->publish_at) {
            return 'Not Published';
        }

        return $this->publish_at->format('M j, Y');
    }

    /**
     * Get the user's discounted Price.
     *
     * @return string
     */
    public function getDiscountedPriceAttribute()
    {
        $discount = $this->price * ($this->discount / 100);

        // return $this->price - $discount;
        return number_format(($this->price - $discount) / 100, 2, '.', ',');
    }

    /**
     * Get the user's Retaail Price.
     *
     * @return string
     */
    public function getRetailPriceAttribute()
    {
        return number_format(($this->price) / 100, 2, '.', ',');
    }

    /**
     * Scope a query to only include users of a given status.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  mixed  $type
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeOfStatus($query, $status)
    {
        return $query->where('status', $status)->orderBy('publish_at', 'desc');
    }

    public function scopePublished($query)
    {
        $dateExists = $this->publish_at;
        if ($dateExists) {
            return $query->orderBy('publish_at', 'desc');
        }
    }

    public function scopeUnpublished($query)
    {
        $dateExists = $this->publish_at;
        if (! $dateExists) {
            return $query->where('publish_at', null)->orderBy('created_at', 'desc');
        }
    }

    public function path()
    {
        return "/product/{$this->id}";
    }

    public function owner()
    {
        return $this->belongsTo(User::class);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }

    public function disp_featured_img()
    {
        if (! Media::find($this->featured_img)) {
            return null;
        } else {
            return Media::find($this->featured_img)->getFullUrl();
        }
    }

    // Media Definitions
    public function registerMediaConversions(?Media $media = null): void
    {
        $this->addMediaConversion('thumb')
        ->width(300)
            ->height(300)
            ->sharpen(10);

        $this->addMediaConversion('full')
        ->width(800)
            ->height(800)
            ->sharpen(10);
    }
}
