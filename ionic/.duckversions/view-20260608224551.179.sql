create view v_user_info as

SELECT
    `u`.`ID` AS `ID`,
    `u`.`user_login` AS `user_login`,
    `u`.`user_email` AS `user_email`,
    `u`.`user_registered` AS `date_registered`,
    `u`.`user_status` AS `user_status`,
    `u`.`display_name` AS `display_name`,
    MAX(
        CASE WHEN `um`.`meta_key` = 'first_name' THEN `um`.`meta_value`
    END
) AS `first_name`,
MAX(
    CASE WHEN `um`.`meta_key` = 'last_name' THEN `um`.`meta_value`
END
) AS `last_name`,
MAX(
    CASE WHEN `um`.`meta_key` = 'mobile_phone' THEN `um`.`meta_value`
END
) AS `mobile_phone`,
MAX(
    CASE WHEN `um`.`meta_key` = 'home_phone' THEN `um`.`meta_value`
END
) AS `home_phone`,
MAX(
    CASE WHEN `um`.`meta_key` = 'street_address' THEN `um`.`meta_value`
END
) AS `street_address`,
MAX(
    CASE WHEN `um`.`meta_key` = 'city' THEN `um`.`meta_value`
END
) AS `city`,
MAX(
    CASE WHEN `um`.`meta_key` = 'state' THEN `um`.`meta_value`
END
) AS `state`,
MAX(
    CASE WHEN `um`.`meta_key` = 'zip' THEN `um`.`meta_value`
END
) AS `zip`,
MAX(
    CASE WHEN `um`.`meta_key` = 'spouse' THEN `um`.`meta_value`
END
) AS `spouse`,
MAX(
    CASE WHEN `um`.`meta_key` = 'birth_month' THEN `um`.`meta_value`
END
) AS `birth_month`,
MAX(
    CASE WHEN `um`.`meta_key` = 'birth_day' THEN `um`.`meta_value`
END
) AS `birth_day`,
MAX(
    CASE WHEN `um`.`meta_key` = 'sponsor' THEN `um`.`meta_value`
END
) AS `sponsor`,
MAX(
    CASE WHEN `um`.`meta_key` = 'year_joined_kiwanis' THEN `um`.`meta_value`
END
) AS `year_joined_kiwanis`,
MAX(
    CASE WHEN `um`.`meta_key` = 'honorary_member' THEN `um`.`meta_value`
END
) AS `honorary_member`,
MAX(
    CASE WHEN `um`.`meta_key` = 'life_member' THEN `um`.`meta_value`
END
) AS `life_member`,
MAX(
    CASE WHEN `um`.`meta_key` = 'wp-last-login' THEN `um`.`meta_value`
END
) AS `unix_last_login`,

MAX(
    CASE WHEN `um`.`meta_key` = 'enabled' THEN `um`.`meta_value`
END
) AS `enabled`,



MAX(
    CASE WHEN `um`.`meta_key` = 'wp-last-login' THEN DATE_FORMAT(
        CONVERT_TZ(
            FROM_UNIXTIME(
                CAST(`um`.`meta_value` AS UNSIGNED)
            ),
            'UTC',
            'America/Denver'
        ),
        '%Y-%m-%d %H:%i:%s'
    )
END
) AS `last_login`
FROM
    (
        `monumen8_wpmhk`.`wplm_users` `u`
    LEFT JOIN `monumen8_wpmhk`.`wplm_usermeta` `um`
    ON
        (`u`.`ID` = `um`.`user_id`)
    )
GROUP BY
    `u`.`ID`,
    `u`.`user_login`,
    `u`.`user_email`,
    `u`.`user_registered`,
    `u`.`user_status`,
    `u`.`display_name`,
    `u`.`display_name`