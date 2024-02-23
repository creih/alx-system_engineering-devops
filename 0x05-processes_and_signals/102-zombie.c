#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void create_zombies(int num_zombies)
{
	pid_t pid;
	int i;

	for (i = 0; i < num_zombies; i++)
	{
		pid = fork();
		if (pid < 0)
		{
			perror("fork");
			exit(EXIT_FAILURE);
		}
		else if (pid == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			exit(EXIT_SUCCESS);
		}
	}
}
int main(void)
{
	create_zombies(5);
	getchar();
	return (0);
}
