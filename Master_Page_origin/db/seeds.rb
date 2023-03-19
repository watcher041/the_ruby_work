
# 古典力学
field1 = Field.create(name:"古典力学")

field1a = field1.children.create(name:"Newton力学（質点・剛体）")
field1b = field1.children.create(name:"解析力学")

# 連続体力学
field2 = Field.create(name:"連続体力学")

field2a = field2.children.create(name:"固体力学")
field2b = field2.children.create(name:"流体力学")
field2c = field2.children.create(name:"レオロジー")

field2a.children.create(name:"弾性力学（材料力学・構造力学）")
field2a.children.create(name:"塑性力学")
field2a.children.create(name:"粘弾性力学")
field2a.children.create(name:"粘塑性力学")

field2b.children.create(name:"Newton流体")
field2b.children.create(name:"非Newton流体")

# 熱力学
field3 = Field.create(name:"熱力学")

# 統計力学
field4 = Field.create(name:"統計力学")

# 電磁気学
field5 = Field.create(name:"電磁気学")

# 量子力学
field6 = Field.create(name:"量子力学")

# 相対性理論
field7 = Field.create(name:"相対性理論")

# 素粒子物理学
field8 = Field.create(name:"素粒子物理学")

# 原子核物理学
field9 = Field.create(name:"原子核物理学")

field9.children.create(name:"核構造物理学")
field9.children.create(name:"ハドロン物理学")

# 宇宙物理学（宇宙論）
field10 = Field.create(name:"宇宙物理学（宇宙論）")

# 物性物理学
field11 = Field.create(name:"物性物理学")

field11.children.create(name:"固体物理学")
field11.children.create(name:"表面科学")
field11.children.create(name:"低温物理学")
field11.children.create(name:"ソフトマター物理学")

# 光学
field12 = Field.create(name:"光学")

# 原子・分子・光物理学
field13 = Field.create(name:"原子・分子・光物理学")

# 音響学
field14 = Field.create(name:"音響学")

# プラズマ物理学
field15 = Field.create(name:"プラズマ物理学")

# 化学物理学
field16 = Field.create(name:"化学物理学")

# 生物物理学（医療物理学）
field17 = Field.create(name:"生物物理学（医療物理学）")

# 地球物理学（大気物理学・海洋物理学）
field18 = Field.create(name:"地球物理学（大気物理学 ・ 海洋物理学）")

# 農業物理学（土壌物理学）
field19 = Field.create(name:"農業物理学（土壌物理学）")

# 経済物理学
field20 = Field.create(name:"経済物理学")
