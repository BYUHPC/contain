# Contain

`contain` prevents a parent process from launching child (and grandchild, etc.) processes that persist beyond the end of its life. This can prevent processes from escaping via `nohup`, `disown`, etc., and is useful for managing programs [like Matlab](https://www.mathworks.com/matlabcentral/answers/2109076-mathworksservicehost-issues-really-slows-down-startup-and-then-doesn-t-stop-when-matlab-stops-in-2) that launch unwanted daemons.

Example usage:

```shell
        bash -c 'sleep 1h & echo $! >      free.pid; disown'
contain bash -c 'sleep 1h & echo $! > contained.pid; disown'
ps -p `cat      free.pid` # still alive
ps -p `cat contained.pid` # dead, or not a sleep process
```



## Installation

Bash and a recent version of [Apptainer](https://apptainer.org/docs/user/latest/quick_start.html#installation) are required to use `contain`.

Install with `make install`:

```shell
make install                     # install at /usr/bin/contain
make install DESTDIR=/mysoftware # install at /mysoftware/bin/contain
```



## Security

`contain` makes escape by child processes difficult, but probably not impossible--maximally, it's only as secure as Apptainer. Pull requests that improve containment are welcome.
