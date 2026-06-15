with videos as (
    select * from {{ ref('stg_videos') }}
),

final as (
    select
        extract(dayofweek from published_at) as day_of_week,
        extract(hour from published_at) as hour_of_day,
        count(*) as total_videos,
        avg(view_count) as avg_views,
        avg(engagement_rate) as avg_engagement_rate
    from videos
    group by 1, 2
)

select * from final