with videos as (
    select * from {{ ref('stg_videos') }}
),

final as (
    select 
        video_id,
        title,
        published_at,
        duration,
        view_count,
        like_count,
        comment_count,
        engagement_rate,
        like_rate,
        comment_rate,
        rank() over (order by view_count desc) as view_rank,
        rank() over (order by engagement_rate desc) as engagement_rank,
        extract(year from published_at_wib) as publish_year,
        extract(month from published_at_wib) as publish_month,
        extract(dayofweek from published_at_wib) as publish_day_of_week,
        extract(hour from published_at_wib) as publish_hour
    from videos
)

select * from final