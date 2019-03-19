package basic;

import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import java.util.Random;

/**
 * BitSet
 * 有1千万个随机数，随机数的范围在1到1亿之间。现在要求写出一种算法，将1到1亿之间没有在随机数中的数求出来？
 * @author Wei.Guang
 * @create 2019-02-18 11:12
 **/
public class BitSiteDemo {

    public static void main(String[] args){
        Random random = new Random();

        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < 1000000; i++) {
            int randomResult = random.nextInt(100000000);
            list.add(randomResult);
        }
        System.out.println("产生的随机数有:");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
        BitSet bitSet = new BitSet(100000000);
        for (int i = 0; i < 1000000; i++) {
            bitSet.set(list.get(i));
        }
        
        System.out.println("0~1亿不在上述随机数中有:" + bitSet.size());
        for (int i = 0; i < 100000000; i++) {
            if (!bitSet.get(i)) {
                System.out.println(i);
            }
        }
    }
}
