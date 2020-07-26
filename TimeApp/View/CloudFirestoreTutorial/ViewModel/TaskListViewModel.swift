

import Foundation
import Combine

class TaskListViewModel: ObservableObject{
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        self.taskCellViewModels = testDataTasks.map{task in
            TaskCellViewModel(task: task)
        }
    }
    
    func removeTasks(atOffsets indexSet: IndexSet) {
        taskCellViewModels.remove(atOffsets: indexSet)
    }
    
    func addTask(task: Task){
        taskCellViewModels.append(TaskCellViewModel(task: task))
    }
}
