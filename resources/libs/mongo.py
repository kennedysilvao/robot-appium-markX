from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://root:root@cluster0.5xczst0.mongodb.net/markX?retryWrites=true&w=majority')

db = client['markX']

@keyword('Remove task from database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_many({'text': task_name})
    print('Removendo a tarefa ' + task_name)

