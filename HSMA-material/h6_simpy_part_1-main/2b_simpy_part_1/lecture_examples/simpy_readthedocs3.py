import simpy
import progressbar

bar = progressbar.ProgressBar(max_value=100)

def example(env):
    event = simpy.events.Timeout(env, delay=1, value=42)
    value = yield event
    print(f"now = {env.now}, value = {value}")


env = simpy.Environment()

bar.start()

for i in range(100):
    p = env.process(example(env))
    env.run(until= env.now + 1)
    bar.update(i +1)

bar.finish()