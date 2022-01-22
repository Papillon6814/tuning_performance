import time
import requests
import asyncio
import psutil

class Entity:
    def __init__(self, time, mem, cpu):
        self.time = time
        self.mem = mem
        self.cpu = cpu

    def calc_ave(self, iterator):
        print(self.time / iterator)
        print(self.mem / iterator)
        print(self.cpu / iterator)

async def get_post():
    return requests.get('http://localhost:4000/get_post?post_id=1')

async def get_tags():
    return requests.get('http://localhost:4000/get_tags_by_post_id?post_id=1')


if __name__ == '__main__':
    for i in range(5):
        iterator = 10
        load_entity = Entity(0, 0, 0)
        async_entity = Entity(0, 0, 0)

        for j in range(iterator):
            print('iteration:', i, j)
            time.sleep(5)
            # 開始
            start_time = time.perf_counter()
            
            response = requests.get('http://localhost:4000/load_post?post_id=1')
            
            # 修了
            end_time = time.perf_counter()
            
            # 経過時間を出力(秒)
            elapsed_time = end_time - start_time
            mem = psutil.virtual_memory() 
            cpu = psutil.cpu_percent(interval=1)

            load_entity.time += elapsed_time
            load_entity.mem += mem.percent
            load_entity.cpu += cpu

            time.sleep(5)

            # 開始
            start_time = time.perf_counter()
            
            loop = asyncio.get_event_loop()
            tasks = [get_tags(), get_post()]
            loop.run_until_complete(asyncio.gather(*tasks))
            
            # 修了
            end_time = time.perf_counter()

            # 経過時間を出力(秒)
            elapsed_time = end_time - start_time
            mem = psutil.virtual_memory() 
            cpu = psutil.cpu_percent(interval=1)

            async_entity.time += elapsed_time
            async_entity.mem += mem.percent
            async_entity.cpu += cpu

        print('\nFINISHED ALL\n')
        print('load_entity')
        load_entity.calc_ave(iterator)
        print('async_entity')
        async_entity.calc_ave(iterator)
