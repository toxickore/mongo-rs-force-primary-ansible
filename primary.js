cfg = rs.conf()
cfg.members[0].priority = 0.5
cfg.members[1].priority = 0.5
cfg.members[2].priority = 1 
cfg.members[3].priority = 0.4
rs.reconfig(cfg)
