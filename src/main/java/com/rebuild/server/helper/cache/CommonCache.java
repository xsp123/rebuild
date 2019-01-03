/*
rebuild - Building your system freely.
Copyright (C) 2018 devezhao <zhaofang123@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

package com.rebuild.server.helper.cache;

import java.io.Serializable;

import org.springframework.cache.CacheManager;

import redis.clients.jedis.JedisPool;

/**
 * Cache for 
 * 
 * @author devezhao
 * @since 12/24/2018
 */
public class CommonCache extends BaseCacheTemplate<Serializable> {

	protected CommonCache(JedisPool jedisPool, CacheManager cacheManager) {
		super(jedisPool, cacheManager, "rb.");
	}
}