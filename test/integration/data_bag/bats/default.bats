#!/usr/bin/env bats

@test "redis should be running" {
  [ "$(ps aux | grep redi[s])" ]
}

@test "redis should start on boot" {
  [ "$(chkconfig --list redis-default | grep 3:on)" ]
}

@test "redis should be listening" {
  [ "$(netstat -plant | grep redis)" ]
}

@test "the config file should be in place" {
  [ -f /etc/redis/default.conf ]
}

@test "the redis user should be there" {
  [ "$(grep ^redis /etc/passwd)" ]
}

@test "the log directory should be there" {
  [ -d /var/log/redis ]
}
