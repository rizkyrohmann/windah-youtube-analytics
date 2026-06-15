with source as (
    select * from {{ source('youtube_raw', 'raw_channel_stats') }}
),

renamed as (
    select
        channel_id,
        channel_name,
        description,
        cast(published_at as timestamp) as published_at,
        subscriber_count,
        view_count,
        video_count,
        uploads_playlist_id,
        cast(extracted_at as timestamp) as extracted_at
    from source
)

select * from renamed