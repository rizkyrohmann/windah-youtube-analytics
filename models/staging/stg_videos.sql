with source as (
    select * from {{ source('youtube_raw', 'raw_video_stats') }}
),
renamed as (
    select
        video_id,
        channel_id,
        title,
        cast(published_at as timestamp) as published_at,
        duration,
        view_count,
        like_count,
        comment_count,
        safe_divide(like_count, view_count) * 100 as like_rate,
        safe_divide(comment_count, view_count) * 100 as comment_rate,
        safe_divide(like_count + comment_count, view_count) * 100 as engagement_rate,
        cast(extracted_at as timestamp) as extracted_at,
        datetime(cast(published_at as timestamp), 'Asia/Jakarta') as published_at_wib
    from source 
)

select * from renamed