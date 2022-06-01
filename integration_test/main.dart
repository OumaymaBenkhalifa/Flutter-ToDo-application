// @dart=2.9
import 'add_label_page_test.dart' as label;
import 'add_project_page_test.dart' as project;
import 'add_task_page_test.dart' as tasks;
import 'completed_tasks_page_test.dart' as tasks_completed;
import 'home_page_test.dart' as home;

void main() {
  //Run test
  home.main();
  tasks.main();
  tasks_completed.main();
  project.main();
  label.main();
  }
