#!/usr/bin/env python
#  -*- coding: utf-8 -*-

import os
import argparse
import subprocess

# print 尽量用函数，不用语句
print('Hello World')
# do not use
print 'Hello World'

def subprocess_test():
    # 执行子进程获得输出内容，尽量用 subprocess吧
    text = os.popen('echo 123').read()
    print(text)

    # subprocess
    # 父进程等待子进程完成
    subprocess.call(['ls', '-l'])
    return_code = subprocess.call('echo subprocess.call', shell=True)
    print(return_code)

    # Popen 不等待子进程完成，需调用 wait() 等待完成
    child = subprocess.Popen(['ls', '-l'])
    child.wait()
    '''
    child.poll()           # 检查子进程状态
    child.kill()           # 终止子进程
    child.send_signal()    # 向子进程发送信号
    child.terminate()      # 终止子进程
    '''
    print('parent process')

    # communicate
    # 尽量不要用 shell=True
    child1 = subprocess.Popen(['ls', '-l'], stdout=subprocess.PIPE)
    child2 = subprocess.Popen(['wc'], stdin=child1.stdout, stdout=subprocess.PIPE)
    out = child2.communicate()
    print('wc:', out)


def os_file_demo():
    # 遍历目录文件
    root = '.'
    for f in os.listdir(root):
        path = os.path.join(root, f)
        print(path)

    # 分割扩展名 ext
    print(os.path.splitext(os.path.basename('/a/b/c.txt')))


def main():
    subprocess_test()
    os_file_demo()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='desc')
    # 参数
    # parser.add_argument('wan', help='eth0')
    # parser.add_argument('lan', help='wlan0')
    # 选项
    parser.add_argument('-v', dest='version', default=None, help='version')
    parser.add_argument('-u', dest='uin', default=None, help='uin')
    parser.add_argument('--verbose', dest='verbose', action='store_true', help='show verbose')

    args = parser.parse_args()
    #print(args.wan, args.lan, args.version, args.uin)

    main()


