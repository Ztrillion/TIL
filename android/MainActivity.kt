package com.cranberryai.intentprac




import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.cranberryai.intentprac.databinding.ActivityMainBinding
import kotlinx.coroutines.*
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.channels.consumeEach
import kotlin.system.measureTimeMillis


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.button.setOnClickListener {
            val channel = Channel<Int>()

            val backgroundScope = CoroutineScope(Dispatchers.Default+ Job())
            backgroundScope.launch {
                var sum = 0L
                var time = measureTimeMillis {
                    for (i in 1..2_000_000_000) {
                        sum += i
                    }
                }
                Log.d("kim", "time : $time")
                channel.send(sum.toInt())
            }

            val mainScope= GlobalScope.launch(Dispatchers.Main) {
                channel.consumeEach {
                    binding.resultView.text = "sum : $it"
                }
            }
        }
    }
}
