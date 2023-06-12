<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'mydb' );

/** Database username */
define( 'DB_USER', 'fbarros' );

/** Database password */
define( 'DB_PASSWORD', 'secret' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '+SKWTJf.%<pn|<jM9iq-hH1Vr9;Z[% 9=f])PF,iP%Og*{!xvKY*fTSE%Ru`4_Vv' );
define( 'SECURE_AUTH_KEY',  'C{PZe0d HeQP94r>fl*vz#Tl!DxVYeEgF`]SC6#32?UR|&G*G5&f&]aRR.1H5eAw' );
define( 'LOGGED_IN_KEY',    'YHiqxd.|1gZHZ5M=giFk;jFiS+!DEl`_;Zwsu&p3h4apA[X^6|JuVu[Ryq1I!!={' );
define( 'NONCE_KEY',        '7R[Vm3XPcHm!#HbHOj~RI2BgB>6jZBOOh2_Pv.gu6;kh7::U6tRt;%Jz|,U[d5em' );
define( 'AUTH_SALT',        '<~+nFWOf*5rLjbPK!/Z:zFJiTJ^4}9kIJRrld ;G6?E#8C#a8(]:s90AZzMt`95]' );
define( 'SECURE_AUTH_SALT', 'p|?Wz(9{Bk=t?xIl,$TJO)_tHtC6B=F^brfLU=Hm^(>DNS<1bM}|24*k_Mh$Io8d' );
define( 'LOGGED_IN_SALT',   'C4?y[V,6+#H6jPUhzL.@nX8yCsb9WXHFKx`QQsQ&c~U2)iN(2}7_$o_K?%P<_r2c' );
define( 'NONCE_SALT',       'Y pnFAgh<pC3/D+T{z{C%Clw]4rTjC_{Fkf[2B;G8Hd~Wa)xbs>x]Wh36E-Dt;:L' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

